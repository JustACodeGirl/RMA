/**
 * WFDicActProperty.java
 * 
 * Copyright@2016 OVT Inc. All rights reserved. 
 * 
 * Mar 1, 2016
 */
package com.ovt.aftersale.common.vo;

import java.util.Map;

import com.ovt.aftersale.common.tools.DataConvertUtils;

/**
 * WFDicActProperty
 * 
 * @Author zhi.liu
 * @Version 1.0
 * @See 
 * @Since [OVT Cloud Platform]/[API] 1.0
 */
public class WFDicActProperty
{
    private int id;
    
    private String name;
    
    public WFDicActProperty() {}
    
    public WFDicActProperty(Map<String, Object> map) 
    {
        this.setId(DataConvertUtils.toInt(map.get("act_def_id")));
        this.setName(DataConvertUtils.toString(map.get("act_property_name")));
    }

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    } 
}
