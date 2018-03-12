/**
 * HumanRight.java
 * 
 * Copyright@2016 OVT Inc. All rights reserved. 
 * 
 * Mar 17, 2016
 */
package com.ovt.aftersale.common.mo;

import java.util.List;

import com.ovt.aftersale.common.vo.Human;

/**
 * HumanRight
 * 
 * @Author zhi.liu
 * @Version 1.0
 * @See 
 * @Since [OVT Cloud Platform]/[API] 1.0
 */
public class HumanRight extends Human
{

    private List<String> rights;
    
    public HumanRight(Human human)
    {
        this.setHuman_id(human.getHuman_id());
        this.setHuman_name(human.getHuman_name());
        this.setPassword(human.getPassword());
        this.setPhone(human.getPhone());
        this.setDescription(human.getDescription());
        this.setEmail(human.getEmail());
        this.setUnit_id(human.getUnit_id());
        this.setRole_id(human.getRole_id());
        this.setCreate_time(human.getCreate_time());
        this.setUpdate_time(human.getUpdate_time());
        this.setIs_deleted(human.getIs_deleted());
    }

    public List<String> getRights()
    {
        return rights;
    }

    public void setRights(List<String> rights)
    {
        this.rights = rights;
    }
}
