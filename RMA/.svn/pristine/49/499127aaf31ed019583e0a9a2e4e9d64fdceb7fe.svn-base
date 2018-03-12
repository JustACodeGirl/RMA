/**
 * Unit.java
 * 
 * Copyright@2016 OVT Inc. All rights reserved. 
 * 
 * Mar 9, 2016
 */
package com.ovt.aftersale.common.vo;

import java.util.Date;
import java.util.Map;

import com.ovt.aftersale.common.tools.DataConvertUtils;

/**
 * Unit
 * 
 * @Author zhi.liu
 * @Version 1.0
 * @See 
 * @Since [OVT Cloud Platform]/[API] 1.0
 */
public class Unit
{

    private int unit_id;
    
    private String unit_name;
    
    private Date create_time;
    
    private int is_deleted;
    
    public Unit() {}
    
    public Unit(Map<String, Object> roleRightMap) 
    {
        this.setUnit_id(DataConvertUtils.toInt(roleRightMap.get("unit_id")));
        this.setUnit_name(DataConvertUtils.toString(roleRightMap.get("unit_name")));
    }

    public int getUnit_id()
    {
        return unit_id;
    }

    public void setUnit_id(int unit_id)
    {
        this.unit_id = unit_id;
    }

    public String getUnit_name()
    {
        return unit_name;
    }

    public void setUnit_name(String unit_name)
    {
        this.unit_name = unit_name;
    }

    public Date getCreate_time()
    {
        return create_time;
    }

    public void setCreate_time(Date create_time)
    {
        this.create_time = create_time;
    }

    public int getIs_deleted()
    {
        return is_deleted;
    }

    public void setIs_deleted(int is_deleted)
    {
        this.is_deleted = is_deleted;
    }
}
