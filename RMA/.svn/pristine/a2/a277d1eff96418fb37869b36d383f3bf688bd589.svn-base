package com.ovt.aftersale.common.dao;

import com.ovt.aftersale.common.tools.JsonDocument;

/**
 * 页面框架管理类
 * @Author lyman.meng
 * @Version 1.0
 * @See 
 * @Since [OVT AFTERSALE]/[Server] 1.0
 */
public interface FrameManager
{
	/**
	 * 获取导航栏列表数据
	 * @param humanID
	 * @return
	 */
    public JsonDocument getNavBarList(int humanID);

    /**
     * 
     * @param humanID
     * @return
     */
    public JsonDocument getTaskList(int humanID);

    /**
     * 获取任务列表数据
     * @param taskListID
     * @param humanID
     * @return
     */
    public JsonDocument  getTaskListMenu(int taskListID, int humanID);

    /**
     * 获取任务列表数据列
     * @param tasklistID
     * @return
     */
    public JsonDocument getTaskListItem(int tasklistID);

    /**
     * 获取任务列表内容数据
     * @param tasklistID
     * @param humanID
     * @return
     */
    public JsonDocument getBillList(int tasklistID,int humanID);
}
