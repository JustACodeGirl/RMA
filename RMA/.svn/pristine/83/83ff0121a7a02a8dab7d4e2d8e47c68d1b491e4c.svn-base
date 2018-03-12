/**
 * HumanRoleServiceImpl.java
 * 
 * Copyright@2016 OVT Inc. All rights reserved. 
 * 
 * Mar 2, 2016
 */
package com.ovt.aftersale.common.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ovt.aftersale.common.dao.HumanRoleManager;
import com.ovt.aftersale.common.exception.InvalidDataInputException;
import com.ovt.aftersale.common.exception.ServiceErrorCode;
import com.ovt.aftersale.common.exception.ServiceException;
import com.ovt.aftersale.common.mo.RoleHuman;
import com.ovt.aftersale.common.service.HumanRoleService;
import com.ovt.aftersale.common.tools.DataFormatValidator;
import com.ovt.aftersale.common.vo.Human;

/**
 * HumanRoleServiceImpl
 * 
 * @Author zhi.liu
 * @Version 1.0
 * @See
 * @Since [OVT Cloud Platform]/[API] 1.0
 */
@Service
public class HumanRoleServiceImpl implements HumanRoleService
{

    @Autowired
    private HumanRoleManager humanRoleManager;

    /*
     * (non-Javadoc)
     * 
     * @see
     * com.ovt.aftersale.common.service.HumanRoleService#addRole(com.ovt.aftersale
     * .common.mo.RoleHuman)
     */
    @Override
    public RoleHuman addRole(RoleHuman role)
    {
        return humanRoleManager.addRole(role);
    }

    /*
     * (non-Javadoc)
     * 
     * @see
     * com.ovt.aftersale.common.service.HumanRoleService#addHuman(com.ovt.aftersale
     * .common.vo.Human)
     */
    @Override
    public Human addHuman(Human human) throws ServiceException
    {
        if (!DataFormatValidator.isValidPassword(human.getPassword()))
        {
            throw new InvalidDataInputException(ServiceErrorCode.INVALID_PASSWORD, "Invalid password.");
        }
        
        return humanRoleManager.addHuman(human);
    }

    /*
     * (non-Javadoc)
     * 
     * @see
     * com.ovt.aftersale.common.service.HumanRoleService#deleteRole(java.lang
     * .String)
     */
    @Override
    public void deleteRole(String roleId)
    {
        humanRoleManager.deleteRole(roleId);
    }

    /*
     * (non-Javadoc)
     * 
     * @see
     * com.ovt.aftersale.common.service.HumanRoleService#deleteHuman(java.lang
     * .String)
     */
    @Override
    public void deleteHuman(String humanId)
    {
        humanRoleManager.deleteHuman(humanId);
    }

    /*
     * (non-Javadoc)
     * 
     * @see
     * com.ovt.aftersale.common.service.HumanRoleService#updateRole(com.ovt.
     * aftersale.common.vo.Role)
     */
    @Override
    public void updateRole(RoleHuman roleHuman)
    {
        humanRoleManager.updateRole(roleHuman);
    }

    /*
     * (non-Javadoc)
     * 
     * @see
     * com.ovt.aftersale.common.service.HumanRoleService#updateHuman(com.ovt
     * .aftersale.common.vo.Human)
     */
    @Override
    public void updateHuman(Human human)
    {
        humanRoleManager.updateHuman(human);
    }

    /*
     * (non-Javadoc)
     * 
     * @see com.ovt.aftersale.common.service.HumanRoleService#getRolesHumans()
     */
    @Override
    public List<RoleHuman> getRolesHumans()
    {
        return humanRoleManager.getRolesHumans();
    }

    /* (non-Javadoc)
     * @see com.ovt.aftersale.common.service.HumanRoleService#getRoleRights(int)
     */
    @Override
    public List<String> getRoleRights(int role_id)
    {
        return humanRoleManager.getRoleRights(role_id);
    }

}
