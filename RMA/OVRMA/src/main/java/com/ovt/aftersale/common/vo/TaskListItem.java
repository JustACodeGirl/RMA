package com.ovt.aftersale.common.vo;

import java.util.Date;

public class TaskListItem
{
    private Integer tasklist_item_id;
    private Integer tasklist_item_name;
    private Integer tasklist_id;
    private String display_name;
    private String description;
    private Integer display_order;
    private Date create_time;
    private Date update_time;
    private Integer is_deleted;
    private Integer is_visible;
	public Integer getTasklist_item_id()
    {
        return tasklist_item_id;
    }
    public void setTasklist_item_id(Integer tasklist_item_id)
    {
        this.tasklist_item_id = tasklist_item_id;
    }
    public Integer getTasklist_item_name()
    {
        return tasklist_item_name;
    }
    public void setTasklist_item_name(Integer tasklist_item_name)
    {
        this.tasklist_item_name = tasklist_item_name;
    }
    public Integer getTasklist_id()
    {
        return tasklist_id;
    }
    public void setTasklist_id(Integer tasklist_id)
    {
        this.tasklist_id = tasklist_id;
    }
    public String getDisplay_name()
    {
        return display_name;
    }
    public void setDisplay_name(String display_name)
    {
        this.display_name = display_name;
    }
    public String getDescription()
    {
        return description;
    }
    public void setDescription(String description)
    {
        this.description = description;
    }
    public Integer getDisplay_order()
    {
        return display_order;
    }
    public void setDisplay_order(Integer display_order)
    {
        this.display_order = display_order;
    }
    public Date getCreate_time()
    {
        return create_time;
    }
    public void setCreate_time(Date create_time)
    {
        this.create_time = create_time;
    }
    public Date getUpdate_time()
    {
        return update_time;
    }
    public void setUpdate_time(Date update_time)
    {
        this.update_time = update_time;
    }
    public Integer getIs_deleted()
    {
        return is_deleted;
    }
    public void setIs_deleted(Integer is_deleted)
    {
        this.is_deleted = is_deleted;
    }
    public Integer getIs_visible()
    {
        return is_visible;
    }
    public void setIs_visible(Integer is_visible)
    {
        this.is_visible = is_visible;
    }
    @Override
	public String toString() {
		return "TaskListItem [tasklist_item_id=" 
				+ tasklist_item_id + ", tasklist_item_name=" 
				+ tasklist_item_name
				+ ", tasklist_id=" + tasklist_id 
				+ ", display_name=" + display_name
				+ ", description=" + description
				+ ", display_order=" + display_order 
				+ ", create_time=" + create_time 
				+ ", update_time=" + update_time
				+ ", is_deleted=" + is_deleted + "]";
	}
}
