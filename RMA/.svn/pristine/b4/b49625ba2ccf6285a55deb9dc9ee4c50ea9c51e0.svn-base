/**
 * Right.java
 * 
 * Copyright@2016 OVT Inc. All rights reserved. 
 * 
 * Mar 1, 2016
 */
package com.ovt.aftersale.common.mo;

import java.util.Map;

import com.ovt.aftersale.common.tools.DataConvertUtils;


/**
 * Right
 * 
 * @Author zhi.liu
 * @Version 1.0
 * @See 
 * @Since [OVT Cloud Platform]/[API] 1.0
 */
public class Right
{
    private int navbar_id;
    
    private String display_name;
    
    private int role_id;
    
    private boolean granted;
    
    public Right() {}
    
    public Right(Map<String, Object> roleRightMap) 
    {
        this.setNavbar_id(DataConvertUtils.toInt(roleRightMap.get("navbar_id")));
        this.setDisplay_name(DataConvertUtils.toString(roleRightMap.get("display_name")));
        this.setRole_id(DataConvertUtils.toInt(roleRightMap.get("role_id")));
    }

    public int getNavbar_id()
    {
        return navbar_id;
    }

    public void setNavbar_id(int navbar_id)
    {
        this.navbar_id = navbar_id;
    }

    public String getDisplay_name()
    {
        return display_name;
    }

    public void setDisplay_name(String display_name)
    {
        this.display_name = display_name;
    }

    public int getRole_id()
    {
        return role_id;
    }

    public void setRole_id(int role_id)
    {
        this.role_id = role_id;
    }

    @Override
    public int hashCode()
    {
        final int prime = 31;
        int result = 1;
        result =
                prime
                        * result
                        + ((display_name == null) ? 0 : display_name.hashCode());
        result = prime * result + navbar_id;
        return result;
    }

    @Override
    public boolean equals(Object obj)
    {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Right other = (Right) obj;
        if (display_name == null)
        {
            if (other.display_name != null)
                return false;
        }
        else if (!display_name.equals(other.display_name))
            return false;
        if (navbar_id != other.navbar_id)
            return false;
        return true;
    }

    public boolean isGranted()
    {
        return granted;
    }

    public void setGranted(boolean granted)
    {
        this.granted = granted;
    }
    
    public Right copy()
    {
        Right right = new Right();
        right.setNavbar_id(this.getNavbar_id());
        right.setDisplay_name(this.getDisplay_name());
        right.setRole_id(this.getRole_id());
        right.setGranted(this.isGranted());
        return right;
    }
}
