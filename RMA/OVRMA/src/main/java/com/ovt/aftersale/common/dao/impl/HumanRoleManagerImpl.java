/**
 * HumanRoleManagerImpl.java
 * 
 * Copyright@2016 OVT Inc. All rights reserved. 
 * 
 * Mar 1, 2016
 */
package com.ovt.aftersale.common.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;
import org.springframework.util.CollectionUtils;

import com.ovt.aftersale.common.constant.PartType;
import com.ovt.aftersale.common.dao.HumanRoleManager;
import com.ovt.aftersale.common.dao.RightManager;
import com.ovt.aftersale.common.mo.Right;
import com.ovt.aftersale.common.mo.RoleHuman;
import com.ovt.aftersale.common.tools.EncryptionUtils;
import com.ovt.aftersale.common.vo.Human;

/**
 * HumanRoleManagerImpl
 * 
 * @Author zhi.liu
 * @Version 1.0
 * @See
 * @Since [OVT Cloud Platform]/[API] 1.0
 */
@Repository
public class HumanRoleManagerImpl implements HumanRoleManager
{
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private RightManager rightManager;

    private static final String INSERT_ROLE =
            "INSERT INTO t_role(role_name, display_name, description, create_time, update_time, is_deleted) "
                    + "VALUES(?, ?, ?, current_timestamp, current_timestamp, 0)";

    private static final String INSERT_ROLE_NAVBAR =
            "INSERT INTO t_role_navbar(role_id, navbar_id) VALUES(?, ?)";
    
    private static final String INSERT_HUMAN_NAVBAR =
            "INSERT INTO t_human_navbar(role_id, human_id, navbar_id) VALUES(?, ?, ?)";
    
    private static final String COPY_NAVBAR_TO_HUMAN_NAVBAR =
            "update t_human_navbar a join t_navbar b set a.navbar_name = b.navbar_name, a.navbar_url = b.navbar_url, a.module_name = b.module_name, "
            + "a.parent_id = b.parent_id, a.display_name = b.display_name, a.description = b.description, "
            + "a.display_order = b.display_order, a.create_time = current_timestamp, a.update_time = current_timestamp "
            + "where a.navbar_id = b.navbar_id and role_id = ?";

    private static final String INSERT_ACT_PART =
            "INSERT INTO t_wf_act_part(act_def_id, part_id, part_property) VALUES(?, ?, ?)";

    private static final String INSERT_HUMAN =
            "INSERT INTO t_human(human_name, password, phone, email, unit_id, description, create_time, update_time, is_deleted) "
                    + "VALUES(?, ?, ?, ?, ?, ?, current_timestamp, current_timestamp, 0)";

    private static final String INSERT_HUMAN_ROLE =
            "INSERT INTO t_human_role(human_id, role_id) VALUES(?, ?)";

    private static final String DELETE_ROLE =
            "DELETE FROM t_role WHERE role_id = ?";

    private static final String DELETE_ACT_PART =
            "DELETE FROM t_wf_act_part WHERE part_property = 2 and part_id = ?";

    private static final String DELETE_ROLE_NAVBAR =
            "DELETE FROM t_role_navbar WHERE role_id = ?";
    
    private static final String DELETE_HUMAN_NAVBAR =
            "DELETE FROM t_human_navbar WHERE role_id = ?";

    private static final String DELETE_HUMAN_ROLE_BY_ROLE =
            "DELETE FROM  t_human_role WHERE role_id = ?";

    private static final String DELETE_HUMAN =
            "DELETE FROM  t_human WHERE human_id = ?";

    private static final String DELETE_HUMAN_ROLE_BY_HUMAN =
            "DELETE FROM  t_human_role WHERE human_id = ?";

    private static final String UPDATE_ROLE =
            "UPDATE t_role SET role_name = ?, display_name = ?, description = ?, is_deleted = ? WHERE role_id = ?";

    private static final String UPDATE_ACT_PART =
            "INSERT INTO t_wf_act_part(act_def_id, part_id, part_property) VALUES(?, ?, 2) "
            + "ON DUPLICATE KEY UPDATE act_def_id = ?";

    private static final String UPDATE_HUMAN =
            "UPDATE t_human SET human_name = ?, phone = ?, email = ?, unit_id = ?, description = ?, "
                    + "is_deleted = ?, update_time = current_timestamp WHERE human_id = ?";
    
    private static final String GET_ALL_ROLE =
            "SELECT r.role_id, r.role_name, r.display_name, r.description, r.create_time, r.is_deleted, ap.act_def_id, dap.act_property_name FROM t_role r "
            + "left join t_wf_act_part ap on r.role_id = ap.part_id and part_property = 2 "
            + "left join t_wf_act_def ad on ap.act_def_id = ad.act_def_id "
            + "left join t_dic_act_property dap on ad.act_property_id = dap.act_property_id";
    
    private static final String GET_ALL_ROLE_NAVBAR =
            "SELECT rn.role_id, rn.navbar_id, n.display_name FROM t_role_navbar rn "
                    + "left join t_navbar n on rn.navbar_id = n.navbar_id ";
    
    private static final String GET_ALL_HUMAN =
            "SELECT hr.role_id, h.human_id, h.human_name, h.phone, h.email, h.unit_id, h.description, h.create_time, h.is_deleted FROM t_human_role hr "
                    + "left join t_human h on hr.human_id = h.human_id ";
    
    private static final String GET_HUMAN_BY_ROLE =
            "SELECT human_id FROM t_human_role where role_id = ?";
    
//    private static final String GET_ROLE_RIGHTS =
//            "SELECT distinct r.right_code FROM t_role_right rr "
//                    + "left join t_right r on rr.right_id = r.right_id where rr.role_id = ?";

    /*
     * (non-Javadoc)
     * 
     * @see
     * com.ovt.aftersale.common.dao.HumanRoleManager#addRole(com.ovt.aftersale
     * .common.vo.Role)
     */
    @Override
    public RoleHuman addRole(final RoleHuman role)
    {
        // role
        KeyHolder keyHolder = new GeneratedKeyHolder();
        PreparedStatementCreator psc = new PreparedStatementCreator()
        {
            public PreparedStatement createPreparedStatement(Connection con)
                    throws SQLException
            {
                PreparedStatement ps =
                        con.prepareStatement(INSERT_ROLE,
                                Statement.RETURN_GENERATED_KEYS);
                ps.setObject(1, role.getRole_name());
                ps.setObject(2, role.getDisplay_name());
                ps.setObject(3, role.getDescription());
                return ps;
            }

        };
        jdbcTemplate.update(psc, keyHolder);
        
        role.setRole_id(keyHolder.getKey().intValue());
        role.setCreate_time(new Date());
        role.setUpdate_time(new Date());
        role.setIs_deleted(0);

        // t_wf_act_part
        if (role.getActProperty() != null)
        {
            jdbcTemplate.update(INSERT_ACT_PART, role.getActProperty().getId(),
                    keyHolder.getKey(), PartType.ROLE.getValue());
        }

        // role_navbar
        saveRoleRights(role, keyHolder.getKey().intValue());
        
        return role;

    }

    /**
     * @param role
     * @param keyHolder
     */
    private void saveRoleRights(final RoleHuman role, int roleId)
    {
        // t_role_right
        if (!CollectionUtils.isEmpty(role.getRights()))
        {
            List<Object[]> batchArgs = new ArrayList<Object[]>();
            for (Right right : role.getRights())
            {
                Object[] arg = new Object[2];
                arg[0] = roleId;
                arg[1] = right.getNavbar_id();

                batchArgs.add(arg);
            }
            jdbcTemplate.batchUpdate(INSERT_ROLE_NAVBAR, batchArgs);
        }
    }
    
    private void saveHumanNavbars(final RoleHuman role, int roleId)
    {
        // t_human_navbar
        if (!CollectionUtils.isEmpty(role.getRights()))
        {
            List<Integer> humanIds = jdbcTemplate.queryForList(GET_HUMAN_BY_ROLE, Integer.class, roleId);
            
            List<Object[]> batchArgs = new ArrayList<Object[]>();
            for (Right right : role.getRights())
            {
                for (int humanId : humanIds)
                {
                    Object[] arg = new Object[3];
                    arg[0] = roleId;
                    arg[1] = humanId;
                    arg[2] = right.getNavbar_id();

                    batchArgs.add(arg);
                }
            }
            jdbcTemplate.batchUpdate(INSERT_HUMAN_NAVBAR, batchArgs);
            
            jdbcTemplate.update(COPY_NAVBAR_TO_HUMAN_NAVBAR, roleId);
        }
    }
    
    /*
     * (non-Javadoc)
     * 
     * @see
     * com.ovt.aftersale.common.dao.HumanRoleManager#addHuman(com.ovt.aftersale
     * .common.vo.Human)
     */
    @Override
    public Human addHuman(final Human human)
    {
        // human
        KeyHolder keyHolder = new GeneratedKeyHolder();
        PreparedStatementCreator psc = new PreparedStatementCreator()
        {
            public PreparedStatement createPreparedStatement(Connection con)
                    throws SQLException
            {
                PreparedStatement ps =
                        con.prepareStatement(INSERT_HUMAN,
                                Statement.RETURN_GENERATED_KEYS);
                ps.setObject(1, human.getHuman_name());
                ps.setObject(2, EncryptionUtils.encrypt(human.getPassword()));
                ps.setObject(3, human.getPhone());
                ps.setObject(4, human.getEmail());
                ps.setObject(5, human.getUnit_id());
                ps.setObject(6, human.getDescription());
                return ps;
            }

        };
        jdbcTemplate.update(psc, keyHolder);
        human.setHuman_id(keyHolder.getKey().intValue());
        human.setCreate_time(new Date());
        human.setUpdate_time(new Date());
        human.setIs_deleted(0);

        // human_role
        jdbcTemplate.update(INSERT_HUMAN_ROLE, human.getHuman_id(),
                human.getRole_id());
        
        return human;
    }

    /*
     * (non-Javadoc)
     * 
     * @see
     * com.ovt.aftersale.common.dao.HumanRoleManager#deleteRole(java.lang.String
     * )
     */
    @Override
    public void deleteRole(String roleId)
    {
        // human_role
        jdbcTemplate.update(DELETE_HUMAN_ROLE_BY_ROLE, roleId);

        // t_role_right
        jdbcTemplate.update(DELETE_ROLE_NAVBAR, roleId);
        
        // t_human_right
        jdbcTemplate.update(DELETE_HUMAN_NAVBAR, roleId);

        // t_wf_act_part
        jdbcTemplate.update(DELETE_ACT_PART, roleId);

        // role
        jdbcTemplate.update(DELETE_ROLE, roleId);
    }

    /*
     * (non-Javadoc)
     * 
     * @see
     * com.ovt.aftersale.common.dao.HumanRoleManager#deleteHuman(java.lang.String
     * )
     */
    @Override
    public void deleteHuman(String humanId)
    {
        // human_role
        jdbcTemplate.update(DELETE_HUMAN_ROLE_BY_HUMAN, humanId);

        // human
        jdbcTemplate.update(DELETE_HUMAN, humanId);
    }

    /*
     * (non-Javadoc)
     * 
     * @see
     * com.ovt.aftersale.common.dao.HumanRoleManager#updateRole(com.ovt.aftersale
     * .common.vo.Role)
     */
    @Override
    public void updateRole(RoleHuman role)
    {
        // role
        jdbcTemplate.update(UPDATE_ROLE, role.getRole_name(), role.getDisplay_name(), role.getDescription(), role.getIs_deleted(), role.getRole_id());

        // t_wf_act_part
        if (role.getActProperty() != null && role.getActProperty().getId() > 0)
        {
            jdbcTemplate.update(UPDATE_ACT_PART, role.getActProperty().getId(),
                    role.getRole_id(), role.getActProperty().getId());
        }
        else {
            jdbcTemplate.update(DELETE_ACT_PART, role.getRole_id());
        }

        // role_navbar & human_navbar
        // (1) clear
        jdbcTemplate.update(DELETE_ROLE_NAVBAR, role.getRole_id());
        jdbcTemplate.update(DELETE_HUMAN_NAVBAR, role.getRole_id());
        
        // (2) add
        saveRoleRights(role, role.getRole_id());
        saveHumanNavbars(role, role.getRole_id());
    }

    /*
     * (non-Javadoc)
     * 
     * @see
     * com.ovt.aftersale.common.dao.HumanRoleManager#updateHuman(com.ovt.aftersale
     * .common.vo.Human)
     */
    @Override
    public void updateHuman(Human human)
    {
        // human
        jdbcTemplate.update(UPDATE_HUMAN, human.getHuman_name(),
                human.getPhone(), human.getEmail(), human.getUnit_id(), human.getDescription(),
                human.getIs_deleted(), human.getHuman_id());
    }

    /*
     * (non-Javadoc)
     * 
     * @see com.ovt.aftersale.common.dao.HumanRoleManager#getRolesHumans()
     */
    @Override
    public List<RoleHuman> getRolesHumans()
    {
        // role
        final List<Map<String, Object>> roleList = jdbcTemplate.queryForList(GET_ALL_ROLE);
        
        // role.right
        final List<Map<String, Object>> roleRightList = jdbcTemplate.queryForList(GET_ALL_ROLE_NAVBAR);
        
        // human
        final List<Map<String, Object>> humanList = jdbcTemplate.queryForList(GET_ALL_HUMAN);
        
        List<RoleHuman> roleHumanList = buildRoleHumanList(roleList, roleRightList, humanList);
        
        return roleHumanList;
    }
    
    private List<Right> newRightList(List<Right> allRights)
    {
        List<Right> rightList = new ArrayList<Right>();
        for (Right right : allRights)
        {
            rightList.add(right.copy());
        }
        
        return rightList;
    }

    /**
     * @param roleList
     * @param roleRightList
     * @param humanList
     * @return
     */
    private List<RoleHuman> buildRoleHumanList(
            List<Map<String, Object>> roleList,
            List<Map<String, Object>> roleRightList,
            List<Map<String, Object>> humanList)
    {
        List<Right> allRights = rightManager.getAllRights();
        
        // roleList -> Map<roleId, RoleHuman>
        Map<Integer, RoleHuman> roleMap = new HashMap<Integer, RoleHuman>();
        for (Map<String, Object> role : roleList)
        {
            RoleHuman roleHuman = new RoleHuman(role);
            roleHuman.getRights().addAll(newRightList(allRights));
            
            roleMap.put(roleHuman.getRole_id(), new RoleHuman(role));
        }
        
        // roleRightList -> RoleHuman.rights
        for (Map<String, Object> roleNavbar : roleRightList)
        {
            Right right = new Right(roleNavbar);
            right.setGranted(true);
            RoleHuman roleHuman = roleMap.get(right.getRole_id());
            
            if (roleHuman != null)
            {
                roleHuman.getRights().remove(right);
                roleHuman.getRights().add(right);
            }
        }
        
        // humanList -> RoleHuman.humans
        for (Map<String, Object> human : humanList)
        {
            Human humanObj = new Human(human);
            RoleHuman roleHuman = roleMap.get(humanObj.getRole_id());
            
            if (roleHuman != null)
            {
                roleHuman.getHumans().add(humanObj);
            }
        }
        
        return new ArrayList<RoleHuman>(roleMap.values());
    }

    /* (non-Javadoc)
     * @see com.ovt.aftersale.common.dao.HumanRoleManager#getRoleRights(int)
     */
    @Override
    public List<String> getRoleRights(int role_id)
    {
        // right
//        final List<String> rightList = jdbcTemplate.queryForList(GET_ROLE_RIGHTS,String.class,role_id);
        final List<String> rightList = null;
        
        return rightList;
    }

}
