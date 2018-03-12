/**
 * HumanRoleController.java
 * 
 * Copyright@2016 OVT Inc. All rights reserved. 
 * 
 * Mar 2, 2016
 */
package com.ovt.aftersale.common.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ovt.aftersale.common.exception.ServiceException;
import com.ovt.aftersale.common.mo.RoleHuman;
import com.ovt.aftersale.common.service.HumanRoleService;
import com.ovt.aftersale.common.tools.JsonDocument;
import com.ovt.aftersale.common.vo.Human;

/**
 * HumanRoleController
 * 
 * @Author zhi.liu
 * @Version 1.0
 * @See 
 * @Since [OVAfterSale]/[API] 1.0
 */
@Controller
@RequestMapping("/roles")
public class HumanRoleController
{
    @Autowired
    private HumanRoleService humanRoleService;

    @RequestMapping(method = RequestMethod.POST, value = "/addrole")
    @ResponseBody
    public JsonDocument addRole(@RequestBody RoleHuman role) 
    {
        role = humanRoleService.addRole(role);
        
        return new JsonDocument(role);
    }

    @RequestMapping(method = RequestMethod.POST, value = "/addhuman")
    @ResponseBody
    public JsonDocument addHuman(@RequestBody Human human)
    {
        try
        {
            human = humanRoleService.addHuman(human);
        }
        catch (ServiceException e)
        {
            new JsonDocument(e.getErrorCode());
        }
        
        return new JsonDocument(human);
    }

    @RequestMapping(method = RequestMethod.POST, value = "/deleterole")
    @ResponseBody
    public JsonDocument deleteRole(@RequestParam String roleId)
    {
        humanRoleService.deleteRole(roleId);
        
        return JsonDocument.SUCCESS;
    }

    @RequestMapping(method = RequestMethod.POST, value = "/deletehuman")
    @ResponseBody
    public JsonDocument deleteHuman(@RequestParam String humanId)
    {
        humanRoleService.deleteHuman(humanId);
        
        return JsonDocument.SUCCESS;
    }

    @RequestMapping(method = RequestMethod.POST, value = "/updaterole")
    @ResponseBody
    public JsonDocument updateRole(@RequestBody RoleHuman roleHuman)
    {
        humanRoleService.updateRole(roleHuman);
        
        return JsonDocument.SUCCESS;
    }

    @RequestMapping(method = RequestMethod.POST, value = "/updatehuman")
    @ResponseBody
    public JsonDocument updateHuman(@RequestBody Human human)
    {
        humanRoleService.updateHuman(human);
        
        return JsonDocument.SUCCESS;
    }

    @RequestMapping(method = RequestMethod.GET, value = "/getroleshumans")
    @ResponseBody
    public JsonDocument getRolesHumans()
    {
        final List<RoleHuman> rolesHumans = humanRoleService.getRolesHumans();
        
        return new JsonDocument(rolesHumans);
    }
}
