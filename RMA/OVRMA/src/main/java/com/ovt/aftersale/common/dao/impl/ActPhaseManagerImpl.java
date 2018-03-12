/**
 * ActPhaseManagerImpl.java
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

import com.ovt.aftersale.common.dao.ActPhaseManager;
import com.ovt.aftersale.common.vo.WFDicActProperty;

/**
 * ActPhaseManagerImpl
 * 
 * @Author zhi.liu
 * @Version 1.0
 * @See
 * @Since [OVT Cloud Platform]/[API] 1.0
 */
@Repository
public class ActPhaseManagerImpl implements ActPhaseManager
{
    @Autowired
    private JdbcTemplate JdbcTemplate;

    private static final String GET_ALL_ACT_PHASE =
            "select ad.act_def_id, dap.act_property_name from t_wf_act_def ad "
            + "inner join t_dic_act_property dap on ad.act_property_id = dap.act_property_id";

    /*
     * (non-Javadoc)
     * 
     * @see com.ovt.aftersale.common.dao.ActPhaseManager#getAllActPhases()
     */
    @Override
    public List<WFDicActProperty> getAllActPhases()
    {
        final List<Map<String, Object>> list =
                JdbcTemplate.queryForList(GET_ALL_ACT_PHASE);

        List<WFDicActProperty> phases = new ArrayList<WFDicActProperty>();
        for (Map<String, Object> map : list)
        {
            phases.add(new WFDicActProperty(map));
        }
        return phases;
    }

}
