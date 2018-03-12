/**
 * TestMain.java
 * 
 * Copyright@2016 OVT Inc. All rights reserved. 
 * 
 * Mar 3, 2016
 */
package com.ovt.aftersale.common;

import java.util.HashMap;
import java.util.Map;

import com.ovt.aftersale.common.mo.Right;
import com.ovt.aftersale.common.mo.RoleHuman;
import com.ovt.aftersale.common.tools.JsonUtil;
import com.ovt.aftersale.common.vo.WFDicActProperty;

/**
 * TestMain
 * 
 * @Author zhi.liu
 * @Version 1.0
 * @See 
 * @Since [OVT Cloud Platform]/[API] 1.0
 */
public class TestMain
{

    public static void main(String[] args)
    {
//        RoleHuman roleHuman = new RoleHuman();
//        roleHuman.setActProperty(new WFDicActProperty());
//        
//        Right right = new Right();
//        right.setRight_id(1);
//        right.setRight_name("查看报表");
//        right.setIs_valid(1);
//        roleHuman.getRights().add(right);
//        
//        right = new Right();
//        right.setRight_id(2);
//        right.setRight_name("下载报表");
//        right.setIs_valid(1);
//        roleHuman.getRights().add(right);
        
//        Human human = new Human();
        
//        JsonDocument success = JsonDocument.SUCCESS;
        
        Map<Right, Boolean> rightMap = new HashMap<Right, Boolean>();
        Right right = new Right();
        right.setNavbar_id(12);
        right.setDisplay_name("ac");
        rightMap.put(right, true);
        
        try
        {
            final String json = JsonUtil.convertToJson(rightMap);
            
            System.out.println(json);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
