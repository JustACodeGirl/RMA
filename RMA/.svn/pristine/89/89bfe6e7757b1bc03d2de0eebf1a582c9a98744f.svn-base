/**
 * ValueCollectionsController.java
 * 
 * Copyright@2016 OVT Inc. All rights reserved. 
 * 
 * Mar 9, 2016
 */
package com.ovt.aftersale.common.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ovt.aftersale.common.mo.Right;
import com.ovt.aftersale.common.service.EnumsService;
import com.ovt.aftersale.common.tools.JsonDocument;
import com.ovt.aftersale.common.vo.Unit;
import com.ovt.aftersale.common.vo.WFDicActProperty;

/**
 * EnumsController
 * 
 * @Author zhi.liu
 * @Version 1.0
 * @See 
 * @Since [OVT RMA]/[API] 1.0
 */
@Controller
@RequestMapping("/list")
public class EnumsController
{
    @Autowired
    private EnumsService enumsService;

    @RequestMapping(method = RequestMethod.GET, value = "/rights")
    @ResponseBody
    public JsonDocument getAllRights()
    {
        final List<Right> allRights = enumsService.getAllRights();
        return new JsonDocument(allRights);
    }
    
    @RequestMapping(method = RequestMethod.GET, value = "/units")
    @ResponseBody
    public JsonDocument getAllUnits()
    {
        final List<Unit> allUnits = enumsService.getAllUnits();
        return new JsonDocument(allUnits);
    }
    
    @RequestMapping(method = RequestMethod.GET, value = "/phases")
    @ResponseBody
    public JsonDocument getAllActPhases()
    {
        final List<WFDicActProperty> allActPhases = enumsService.getAllActPhases();
        return new JsonDocument(allActPhases);
    }
    
}
