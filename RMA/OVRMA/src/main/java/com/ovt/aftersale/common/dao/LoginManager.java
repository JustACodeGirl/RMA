package com.ovt.aftersale.common.dao;

import com.ovt.aftersale.common.exception.ServiceException;
import com.ovt.aftersale.common.vo.Human;

/**
 * 登陆管理类
 * @Author zhi.liu
 * @Version 1.0
 * @See
 * @Since [OVT AFTERSALE]/[Server] 1.0
 */
public interface LoginManager
{
    /**
     * Get user by access token.
     * 
     * @param accessToken
     * @return
     * @throws ServiceException
     */
    Human getUserByAccessToken(String accessToken);

    /**
     * Login.
     * 
     * @param email
     * @param password
     * @return accessToken
     * @throws ServiceException
     */
    String login(String email, String password);

    /**
     * Logout.
     * 
     * @param accessToken
     * @throws ServiceException
     */
    void logout(String accessToken);

    /**
     * Change password.
     * 
     * @param oldPassword
     * @param newPassword
     * @return
     */
    String changePassword(String oldPassword, String newPassword) throws ServiceException;
}
