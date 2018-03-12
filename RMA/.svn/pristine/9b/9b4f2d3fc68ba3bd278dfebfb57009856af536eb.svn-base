/**
 * RoleService.java
 * 
 * Copyright@2016 OVT Inc. All rights reserved. 
 * 
 * Mar 1, 2016
 */
package com.ovt.aftersale.common.dao;

import java.util.List;

import com.ovt.aftersale.common.mo.RoleHuman;
import com.ovt.aftersale.common.vo.Human;

/**
 * RoleService
 * 
 * @Author zhi.liu
 * @Version 1.0
 * @See 
 * @Since [OVT Cloud Platform]/[API] 1.0
 */
public interface HumanRoleManager
{

    RoleHuman addRole(RoleHuman role);
    
    Human addHuman(Human human);
    
    void deleteRole(String roleId);
    
    void deleteHuman(String humanId);
    
    void updateRole(RoleHuman role);
    
    void updateHuman(Human human);
    
    List<RoleHuman> getRolesHumans();

    List<String> getRoleRights(int role_id);
}
