package com.ovt.aftersale.common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ovt.aftersale.common.context.SessionContext;
import com.ovt.aftersale.common.dao.LoginManager;
import com.ovt.aftersale.common.exception.ServiceException;
import com.ovt.aftersale.common.service.HumanRoleService;
import com.ovt.aftersale.common.tools.CookieUtil;
import com.ovt.aftersale.common.tools.JsonDocument;

/**
 * 登陆控制类
 * @Author lyman.meng
 * @Version 1.0
 * @See 
 * @Since [OVT AFTERSALE]/[Server] 1.0
 */
@Controller
@RequestMapping("/user")
public class LoginController
{ 
	@Autowired
    private LoginManager userService;
	
	@Autowired
	private HumanRoleService humanRoleService;
	
	private static final int TOKEN_AGE_IN_COOCKIE = 86400000;

	/**
	 * 登陆接口
	 * @param response
	 * @param name
	 * @param password
	 * @return
	 */
    @RequestMapping(method = RequestMethod.POST, value = "/login")
    @ResponseBody
    public JsonDocument login(HttpServletResponse response,
            @RequestParam String name, @RequestParam String password)
    {
        String accessToken = userService.login(name, password);
        if(null == accessToken)
        {
            return new JsonDocument("UserNameOrPasswordWrong");
        }
        CookieUtil.addCookie(response, CookieUtil.KEY_ACCESS_TOKEN, accessToken,
                86400);

        return new JsonDocument(SessionContext.getCurrentHuman());
    }

    /**
     * 登出接口
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(method = RequestMethod.POST, value = "/logout")
    @ResponseBody
    public JsonDocument logout(HttpServletRequest request,
            HttpServletResponse response)
    {
        String accessToken = CookieUtil.getCookie(request,
                CookieUtil.KEY_ACCESS_TOKEN);
        userService.logout(accessToken);

        CookieUtil.addCookie(response, CookieUtil.KEY_ACCESS_TOKEN, accessToken,
                TOKEN_AGE_IN_COOCKIE);

        return new JsonDocument();
    }

    /**
     * Change user password.
     * 
     * @param oldPassword
     * @param newPassword
     * @return
     * @throws ServiceException
     */
    @RequestMapping(method = RequestMethod.POST, value = "/change_password")
    @ResponseBody
    public JsonDocument changePassword(HttpServletResponse response,
            @RequestParam String oldPassword, @RequestParam String newPassword)
    {
        String newAccessToken = "";
        try
        {
            newAccessToken = userService.changePassword(oldPassword,
                    newPassword);
        }
        catch (ServiceException e)
        {
            return new JsonDocument(e.getErrorCode());
        }

        CookieUtil.addCookie(response, CookieUtil.KEY_ACCESS_TOKEN,
                newAccessToken, TOKEN_AGE_IN_COOCKIE);

        return new JsonDocument();
    }
}