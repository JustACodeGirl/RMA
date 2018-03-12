package com.ovt.aftersale.common.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ovt.aftersale.common.dao.FrameManager;
import com.ovt.aftersale.common.tools.JsonDocument;

/**
 * 页面框架控制类，为导航栏、任务列表等公用界面提供数据接口
 * @Author lyman.meng
 * @Version 1.0
 * @See 
 * @Since [OVT AFTERSALE]/[Server] 1.0
 */
@Controller
@RequestMapping("/frame")
public class FrameController
{
	@Autowired
	protected FrameManager frameManager;
	
	/**
	 * 获取导航栏列表信息
	 * @param request
	 * @return
	 */
    @RequestMapping(method = RequestMethod.POST, value = "/getnavbarlist")
    @ResponseBody
    public JsonDocument getNavBarList(HttpServletRequest request)
    {
        int humanID = ServletRequestUtils.getIntParameter(request, "human_id",-1);
        JsonDocument result = frameManager.getNavBarList(humanID);
        return result;
    }

    /**
     * 获取任务列表信息
     * @param request
     * @return
     */
    @RequestMapping(method = RequestMethod.POST, value = "/gettasklist")
    @ResponseBody
    public JsonDocument getTasklists(HttpServletRequest request)
    {
        int humanID = ServletRequestUtils.getIntParameter(request, "human_id",-1);
        JsonDocument result = frameManager.getTaskList(humanID);
        return result;
    }

    /**
     * 获取任务列表对应的菜单信息
     * @param request
     * @return
     */
    @RequestMapping(method = RequestMethod.POST, value = "/gettasklistmenu")
    @ResponseBody
    public JsonDocument getTaskListMenu(HttpServletRequest request)
    {
        int tasklistID = ServletRequestUtils.getIntParameter(request, "tasklist_id",-1);
        int humanID = ServletRequestUtils.getIntParameter(request, "human_id",-1);
        JsonDocument result = frameManager.getTaskListMenu(tasklistID, humanID);
        return result;
    }

    /**
     * 获取任务列表对应的数据列信息
     * @param request
     * @return
     */
    @RequestMapping(method = RequestMethod.POST, value = "/gettasklistitem")
    @ResponseBody
    public JsonDocument getTaskListItem(HttpServletRequest request)
    {
    	int tasklistID = ServletRequestUtils.getIntParameter(request, "tasklist_id",-1);
    	JsonDocument result = frameManager.getTaskListItem(tasklistID);
        return result;
    }
    
    /**
     * 获取任务列表内容信息
     * @param request
     * @return
     */
    @RequestMapping(method = RequestMethod.POST, value = "/getbilllist")
    @ResponseBody
    public JsonDocument getBillList(HttpServletRequest request)
    {
        int tasklistID = ServletRequestUtils.getIntParameter(request, "tasklist_id",-1);
        int humanID = ServletRequestUtils.getIntParameter(request, "human_id",-1);
        JsonDocument result = frameManager.getBillList(tasklistID, humanID);
        return result;
    }

}