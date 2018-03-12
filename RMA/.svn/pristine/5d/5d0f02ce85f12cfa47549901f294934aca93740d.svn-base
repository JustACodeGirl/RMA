/**
 * 页面框架管理实现类
 * @Author lyman.meng
 * @Version 1.0
 * @See 
 * @Since [OVT AFTERSALE]/[Server] 1.0
 */
package com.ovt.aftersale.common.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.ovt.aftersale.common.constant.StateCode;
import com.ovt.aftersale.common.dao.FrameManager;
import com.ovt.aftersale.common.tools.DAORowMapper;
import com.ovt.aftersale.common.tools.JsonDocument;
import com.ovt.aftersale.common.vo.Bill;
import com.ovt.aftersale.common.vo.NavBar;
import com.ovt.aftersale.common.vo.TaskList;
import com.ovt.aftersale.common.vo.TaskListItem;
import com.ovt.aftersale.common.vo.TaskListMenu;

@Repository
public class FrameManagerImpl implements FrameManager
{
    @Autowired
    private JdbcTemplate jdbcTemplate = null;
    private static final Log LOG = LogFactory.getLog(FrameManagerImpl.class);

    // 获取导航栏
    // humanNavBar(humanID,navBarID)
    public JsonDocument getNavBarList(int humanID)
    {
        List<NavBar> navBarList = new ArrayList<NavBar>();
        String sql = "select navbar_id,navbar_name,navbar_url,parent_id,module_name,"
        		+ "display_name,display_order from t_human_navbar where human_id = ?";
        try
        {
            navBarList = jdbcTemplate.query(sql, new DAORowMapper<NavBar>(
                    NavBar.class), humanID);
        }
        catch (Exception e)
        {
            LOG.error("获取导航栏列表失败!", e);
            return new JsonDocument(StateCode.INTERNAL_WRONG_CODE);
            
        }
        JsonDocument result = new JsonDocument(navBarList);
        return result;
    }

    // 获取任务列表
    public JsonDocument getTaskList(int humanID)
    {
        List<TaskList> taskList = new ArrayList<TaskList>();
        String sql = "select tasklist_id,tasklist_name,query_sql,display_name,"
        		+ "display_order from t_human_tasklist where human_id = ? order by display_order";
        try
        {
            taskList = jdbcTemplate.query(sql, new DAORowMapper<TaskList>(
                    TaskList.class), humanID);
        }
        catch (Exception e)
        {
            LOG.error("获取任务列表失败!", e);
            return new JsonDocument(StateCode.INTERNAL_WRONG_CODE);
        }
        JsonDocument result = new JsonDocument(taskList);
        return result;
    }

    // 获取任务列表对应菜单
    public JsonDocument getTaskListMenu(int taskListID, int humanID)
    {
        List<TaskListMenu> tasklistMenus = new ArrayList<TaskListMenu>();
        String sql = "select menu_id,tasklist_id,menu_name,display_name,display_order"
        		+ " from t_human_tasklist_menu where human_id = ? and tasklist_id = ?";
        try
        {
            tasklistMenus = jdbcTemplate.query(sql, new DAORowMapper<TaskListMenu>(
                    TaskListMenu.class), humanID,taskListID);
        }
        catch (Exception e)
        {
            LOG.error("获取任务列表菜单失败!", e);
            return new JsonDocument(StateCode.INTERNAL_WRONG_CODE);
        }
        JsonDocument result = new JsonDocument(tasklistMenus);
        return result;
    }

    // 获取任务列表的每个数据列
    public JsonDocument getTaskListItem(int tasklistID)
    {
        List<TaskListItem> tasklistItems = new ArrayList<TaskListItem>();
        String sql = "select tasklist_item_id,tasklist_item_name,tasklist_id,display_name,"
        		+ "display_order,is_visible from t_tasklist_item where tasklist_id = ?";
        try
        {
            tasklistItems = jdbcTemplate.query(sql, new DAORowMapper<TaskListItem>(
                    TaskListItem.class), tasklistID);
        }
        catch (Exception e)
        {
            LOG.error("获取任务列表列失败!", e);
            return new JsonDocument(StateCode.INTERNAL_WRONG_CODE);
        }
        JsonDocument result = new JsonDocument(tasklistItems);
        return result;
    }

    //获取箱子数据
    public JsonDocument getBillList(int tasklistID,int humanID)
    {
        List<Bill> billList = new ArrayList<Bill>();
        //查询出开箱语句
        String sql = "select query_sql from t_tasklist where tasklist_id = ?";
        String querySql = jdbcTemplate.queryForObject(sql, String.class, tasklistID);
        sql = "select group_concat(tasklist_item_name) from t_tasklist_item where tasklist_id = ?";
        String tasklistItem = jdbcTemplate.queryForObject(sql, String.class, tasklistID);
        sql = "select group_concat(role_id) from t_human_role where human_id = ?";
        String roleString = jdbcTemplate.queryForObject(sql, String.class, humanID);
        sql = "select " + tasklistItem + " from t_bill a,t_bill_act b where " 
        + querySql + " and a.bill_id = b.bill_id and "
        		+ "( b.human_id = ? or (b.role_id in ("+roleString+") and b.human_id is null ))"
        		        + " group by a.bill_id";
        billList = jdbcTemplate.query(sql, new DAORowMapper<Bill>(
                Bill.class), humanID);
        JsonDocument result = new JsonDocument(billList);
        return result;
    }
}
