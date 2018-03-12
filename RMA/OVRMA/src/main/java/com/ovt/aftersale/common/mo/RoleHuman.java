/**
 * RoleHuman.java
 * 
 * Copyright@2016 OVT Inc. All rights reserved. 
 * 
 * Mar 1, 2016
 */
package com.ovt.aftersale.common.mo;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.ovt.aftersale.common.tools.DataConvertUtils;
import com.ovt.aftersale.common.vo.Human;
import com.ovt.aftersale.common.vo.Role;
import com.ovt.aftersale.common.vo.WFDicActProperty;

/**
 * RoleHuman
 * 
 * @Author zhi.liu
 * @Version 1.0
 * @See 
 * @Since [OVT Cloud Platform]/[API] 1.0
 */
public class RoleHuman extends Role
{
    private WFDicActProperty actProperty;
    
    private List<Human> humans = new ArrayList<Human>();
    
    private Set<Right> rights = new HashSet<Right>();
    
    public RoleHuman() {}
    
    public RoleHuman(Map<String, Object> roleMap) 
    {
        //r.role_id, r.role_name, r.create_time, r.is_deleted, ap.act_def_id, dap.act_propertyname 
        this.setRole_id(DataConvertUtils.toInt(roleMap.get("role_id")));
        this.setRole_name(DataConvertUtils.toString(roleMap.get("role_name")));
        this.setDisplay_name(DataConvertUtils.toString(roleMap.get("display_name")));
        this.setCreate_time(DataConvertUtils.toTimestamp(roleMap.get("create_time")));
        this.setIs_deleted(DataConvertUtils.toInt(roleMap.get("is_deleted")));
        
        this.actProperty = new WFDicActProperty();
        this.actProperty.setId(DataConvertUtils.toInt(roleMap.get("act_def_id")));
        this.actProperty.setName(DataConvertUtils.toString(roleMap.get("act_property_name")));
    }

    public List<Human> getHumans()
    {
        return humans;
    }

    public void setHumans(List<Human> humans)
    {
        this.humans = humans;
    }

    public WFDicActProperty getActProperty()
    {
        return actProperty;
    }

    public void setActProperty(WFDicActProperty actProperty)
    {
        this.actProperty = actProperty;
    }

    public Set<Right> getRights()
    {
        return rights;
    }

    public void setRights(Set<Right> rights)
    {
        this.rights = rights;
    }
}
