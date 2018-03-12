/**
 * EnumsServiceImpl.java
 * 
 * Copyright@2016 OVT Inc. All rights reserved. 
 * 
 * Mar 9, 2016
 */
package com.ovt.aftersale.common.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ovt.aftersale.common.dao.ActPhaseManager;
import com.ovt.aftersale.common.dao.RightManager;
import com.ovt.aftersale.common.dao.UnitManager;
import com.ovt.aftersale.common.mo.Right;
import com.ovt.aftersale.common.service.EnumsService;
import com.ovt.aftersale.common.vo.Unit;
import com.ovt.aftersale.common.vo.WFDicActProperty;

/**
 * EnumsServiceImpl
 * 
 * @Author zhi.liu
 * @Version 1.0
 * @See 
 * @Since [OVT Cloud Platform]/[API] 1.0
 */
@Service
public class EnumsServiceImpl implements EnumsService
{
    @Autowired
    private RightManager rightManager;
    
    @Autowired
    private UnitManager unitManager;
    
    @Autowired
    private ActPhaseManager actPhaseManager;

    /* (non-Javadoc)
     * @see com.ovt.aftersale.common.service.EnumsService#getAllRights()
     */
    @Override
    public List<Right> getAllRights()
    {
        return rightManager.getAllRights();
    }

    /* (non-Javadoc)
     * @see com.ovt.aftersale.common.service.EnumsService#getAllUnits()
     */
    @Override
    public List<Unit> getAllUnits()
    {
        return unitManager.getAllUnits();
    }

    /* (non-Javadoc)
     * @see com.ovt.aftersale.common.service.EnumsService#getAllActPhases()
     */
    @Override
    public List<WFDicActProperty> getAllActPhases()
    {
        return actPhaseManager.getAllActPhases();
    }

}
