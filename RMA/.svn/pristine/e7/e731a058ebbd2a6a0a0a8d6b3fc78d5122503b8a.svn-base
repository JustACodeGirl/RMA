/**
 * RightManagerImpl.java
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

import com.ovt.aftersale.common.dao.RightManager;
import com.ovt.aftersale.common.mo.Right;

/**
 * RightManagerImpl
 * 
 * @Author zhi.liu
 * @Version 1.0
 * @See 
 * @Since [OVT Cloud Platform]/[API] 1.0
 */
@Repository
public class RightManagerImpl implements RightManager
{
    @Autowired
    private JdbcTemplate JdbcTemplate;
    
    private static final String GET_ALL_RIGHT = "select navbar_id, display_name from t_navbar where is_deleted = 0";

    /* (non-Javadoc)
     * @see com.ovt.aftersale.common.dao.RightManager#getAllRights()
     */
    @Override
    public List<Right> getAllRights()
    {
        final List<Map<String, Object>> list = JdbcTemplate.queryForList(GET_ALL_RIGHT);
        
        List<Right> rights = new ArrayList<Right>();
        for (Map<String, Object> map : list)
        {
            rights.add(new Right(map));
        }
        return rights;
    }

}
