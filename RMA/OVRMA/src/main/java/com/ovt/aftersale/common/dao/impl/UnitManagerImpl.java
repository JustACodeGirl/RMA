/**
 * UnitManagerImpl.java
 * 
 * Copyright@2016 OVT Inc. All rights reserved. 
 * 
 * Mar 9, 2016
 */
package com.ovt.aftersale.common.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.ovt.aftersale.common.dao.UnitManager;
import com.ovt.aftersale.common.vo.Unit;

/**
 * UnitManagerImpl
 * 
 * @Author zhi.liu
 * @Version 1.0
 * @See 
 * @Since [OVT Cloud Platform]/[API] 1.0
 */
@Repository
public class UnitManagerImpl implements UnitManager
{
    @Autowired
    private JdbcTemplate JdbcTemplate;
    
    private static final String GET_ALL_UNIT = "select unit_id, unit_name from t_unit where is_deleted = 0";

    /* (non-Javadoc)
     * @see com.ovt.aftersale.common.dao.UnitManager#getAllUnits()
     */
    @Override
    public List<Unit> getAllUnits()
    {
        final List<Map<String, Object>> list = JdbcTemplate.queryForList(GET_ALL_UNIT);
        
        List<Unit> units = new ArrayList<Unit>();
        for (Map<String, Object> map : list)
        {
            units.add(new Unit(map));
        }
        return units;
    }

}
