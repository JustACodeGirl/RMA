/**
 * ActPhaseManager.java
 * 
 * Copyright@2016 OVT Inc. All rights reserved. 
 * 
 * Mar 9, 2016
 */
package com.ovt.aftersale.common.dao;

import java.util.List;

import com.ovt.aftersale.common.vo.WFDicActProperty;

/**
 * ActPhaseManager
 * 
 * @Author zhi.liu
 * @Version 1.0
 * @See 
 * @Since [OVT Cloud Platform]/[API] 1.0
 */
public interface ActPhaseManager
{

    List<WFDicActProperty> getAllActPhases();

}