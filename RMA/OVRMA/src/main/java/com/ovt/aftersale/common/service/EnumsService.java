/**
 * ValueCollectionsService.java
 * 
 * Copyright@2016 OVT Inc. All rights reserved. 
 * 
 * Mar 9, 2016
 */
package com.ovt.aftersale.common.service;

import java.util.List;

import com.ovt.aftersale.common.mo.Right;
import com.ovt.aftersale.common.vo.Unit;
import com.ovt.aftersale.common.vo.WFDicActProperty;

/**
 * ValueCollectionsService
 * 
 * @Author zhi.liu
 * @Version 1.0
 * @See 
 * @Since [OVT Cloud Platform]/[API] 1.0
 */
public interface EnumsService
{

    List<Right> getAllRights();
    
    List<Unit> getAllUnits();

    List<WFDicActProperty> getAllActPhases();
}
