package com.ovt.aftersale.common.dao.impl;

import java.sql.Timestamp;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.ovt.aftersale.common.config.SysConfig;
import com.ovt.aftersale.common.context.SessionContext;
import com.ovt.aftersale.common.dao.LoginManager;
import com.ovt.aftersale.common.exception.InvalidDataInputException;
import com.ovt.aftersale.common.exception.ServiceErrorCode;
import com.ovt.aftersale.common.exception.ServiceException;
import com.ovt.aftersale.common.tools.DAORowMapper;
import com.ovt.aftersale.common.tools.DataFormatValidator;
import com.ovt.aftersale.common.tools.DateTimeUtils;
import com.ovt.aftersale.common.tools.EncryptionUtils;
import com.ovt.aftersale.common.tools.StringUtils;
import com.ovt.aftersale.common.vo.Human;

/**
 * 登陆管理实现类
 * @Author lyman.meng
 * @Version 1.0
 * @See 
 * @Since [OVT AFTERSALE]/[Server] 1.0
 */
@Service
public class LoginManagerImpl implements LoginManager
{
    @Autowired
    private JdbcTemplate jdbcTemplate = null;

    private static final Log logger = LogFactory.getLog(LoginManagerImpl.class.getName());

    public Human getUserByAccessToken(String accessToken)
    {
        String sql = "select at_admin_id from t_admin_token "
            + "where at_admin_token = ? limit 1";
        long humanID = jdbcTemplate.queryForObject(sql, Long.class, accessToken);

        sql = "select human_id,human_name, password, email,phone,unit_id description "
        		+ "from t_human where is_deleted = 0 and human_id = ? limit 1";
        Human human = jdbcTemplate.query(sql, new DAORowMapper<Human>(
                Human.class), humanID).get(0);
        if (human == null)
        {
            logger.error("Failed to find user by userId!");
        }   
        return human;
    }

    public String login(String name, String password) 
    {
        // check args' format
        // checkFormat(name, password);
        String sql = "select a.human_id,a.human_name,password,role_id from t_human a,"
                + "t_human_role b where a.human_name = ? and a.human_id = b.human_id  limit 1";
        List<Human> humans = jdbcTemplate.query(sql, new DAORowMapper<Human>(
                Human.class), name);
        if (0 == humans.size())
        {
            logger.error("User is not exist!");
            return null;
        }
        Human human = humans.get(0);
        // check password
        if (!StringUtils.equals(human.getPassword(),
                EncryptionUtils.encrypt(password)))
        {
            return null;
        }
        
        // generate accessToken
        String accessToken = generateAccessToken(human.getHuman_id());
        
        // put user into session context
//        human.setPassword(null);
        SessionContext.setCurrentHuman(human);

        return accessToken;
    }

    /**
     * @param human
     * @return
     */
    private String generateAccessToken(int humanId)
    {
        String sql;
        // generate access token
        sql =  "insert ignore into t_admin_token(at_admin_id, at_admin_token, "
                + "at_expire_time, update_time, create_time) "
                + "values (?, ?, ?, current_timestamp, current_timestamp)";
        String accessToken = EncryptionUtils.generateUUID();

        String expireTime = new Timestamp(DateTimeUtils.addSeconds(
                new java.util.Date(), SysConfig.cookieAccessTokenAge)
                .getTime()).toString();
        jdbcTemplate.update(sql, humanId,accessToken,expireTime);
        return accessToken;
    }

    public void logout(String accessToken)
    {
        if (StringUtils.isNotBlank(accessToken))
        {
            String sql = "delete from t_admin_token where at_admin_token = ?";
            jdbcTemplate.update(sql, accessToken);
        }
    }

    /* (non-Javadoc)
     * @see com.ovt.aftersale.common.dao.LoginManager#changePassword(java.lang.String, java.lang.String)
     */
    @Override
    public String changePassword(String oldPassword, String newPassword) throws ServiceException
    {
        // check format
        if (/*!DataFormatValidator.isValidPassword(oldPassword)
                || */!DataFormatValidator.isValidPassword(newPassword))
        {
            throw new InvalidDataInputException(ServiceErrorCode.INVALID_PASSWORD,
                    "Password format is invalid!");
        }

        // new password can't be same as old one
        if (StringUtils.equals(oldPassword, newPassword))
        {
            throw new InvalidDataInputException(ServiceErrorCode.SAME_NEW_OLD_PASSWORD,
                    "New password can't be same as old one!");
        }

        Human currentUser = SessionContext.getCurrentHuman();

        // check old password
        if (!StringUtils.equals(currentUser.getPassword(), EncryptionUtils.encrypt(oldPassword)))
        {
            throw new InvalidDataInputException(ServiceErrorCode.WRONG_PASSWORD,
                    "Old password is wrong!");
        }

        // change password flow
        String accessToken = changePassword(newPassword, currentUser.getHuman_id());

        return accessToken;
    }

    /**
     * change password flow.
     * 
     * @param newPassword
     * @param currentUser
     * @return
     * @throws ServiceException
     */
    private String changePassword(String newPassword, int currentUserId)
    {
        // update
        changePassword(currentUserId, newPassword);

        // invalid all old access tokens of user
        invalidTokensByUser(currentUserId);

        // generate new access token
        String accessToken = generateAccessToken(currentUserId);
        return accessToken;
    }

    /**
     * @param currentUserId
     */
    private void invalidTokensByUser(int currentUserId)
    {
        String sql = "DELETE FROM t_admin_token WHERE at_admin_id = ?";
        
        jdbcTemplate.update(sql, currentUserId);
    }

    /**
     * @param currentUserId
     * @param newPassword
     */
    private void changePassword(int currentUserId, String newPassword)
    {
        String sql = "UPDATE t_human SET password = ?, update_time = CURRENT_TIMESTAMP "
                + "WHERE human_id = ?";
        
        jdbcTemplate.update(sql, EncryptionUtils.encrypt(newPassword), currentUserId);
    }

}
