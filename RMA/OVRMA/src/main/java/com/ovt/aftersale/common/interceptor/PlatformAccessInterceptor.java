package com.ovt.aftersale.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.http.server.ServletServerHttpResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ovt.aftersale.common.constant.StateCode;
import com.ovt.aftersale.common.context.SessionContext;
import com.ovt.aftersale.common.dao.LoginManager;
import com.ovt.aftersale.common.tools.CookieUtil;
import com.ovt.aftersale.common.tools.JsonDocument;
import com.ovt.aftersale.common.tools.StringUtils;
import com.ovt.aftersale.common.vo.Human;

/**
 * PlatformAccessInterceptor do the following things:
 * <li>identify user by access token from cookies before call controller</li>
 * 
 * @Author zhi.liu
 * @Version 1.0
 * @See
 * @Since [OVT AFTERSALE]/[Server] 1.0
 */
public class PlatformAccessInterceptor extends HandlerInterceptorAdapter
{
    @Autowired
    private LoginManager userManager;

    @Override
    public boolean preHandle(HttpServletRequest request,
            HttpServletResponse response, Object handler) throws Exception
    {
        super.preHandle(request, response, handler);
        String accessToken = null;
        MappingJackson2HttpMessageConverter converter = new MappingJackson2HttpMessageConverter();
            // get from cookie
            accessToken = CookieUtil.getCookie(request,
                    CookieUtil.KEY_ACCESS_TOKEN);
            // get from parameter if can't find in cookies
            if (StringUtils.isBlank(accessToken))
            {
                accessToken = request.getParameter(CookieUtil.KEY_ACCESS_TOKEN);
            }

            if (StringUtils.isBlank(accessToken))
            {
                JsonDocument respBody = new JsonDocument(StateCode.USER_NOT_LOGIN);

                // Spring internal json converter
                converter.write(respBody, MediaType.APPLICATION_JSON,
                        new ServletServerHttpResponse(response));

                return false;
            }
        // initial user session
        initSessionContext(accessToken);

        // access forbidden case:
        JsonDocument respBody = null;
        if (SessionContext.getCurrentHuman() == null)
        {
            respBody = new JsonDocument("InvalidAccess");
        }

        if (respBody != null)
        {
            converter.write(respBody, MediaType.APPLICATION_JSON,
                    new ServletServerHttpResponse(response));

            return false;
        }

        return true;
    }

    /**
     * Initial session context.
     * 
     * @param request
     * @throws ServiceException
     * @throws NoAccessException
     */
    private void initSessionContext(String accessToken)
    {
        Human human = userManager.getUserByAccessToken(accessToken);
        SessionContext.setCurrentHuman(human);
    }

    @Override
    public void postHandle(HttpServletRequest request,
            HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception
    {
        super.postHandle(request, response, handler, modelAndView);

        SessionContext.destroy();
    }

}
