package com.ovt.aftersale.common.config;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.jdbc.core.JdbcTemplate;

import com.ovt.aftersale.common.constant.DataTypeConst;
import com.ovt.aftersale.common.tools.BeanFactoryUtil;
import com.ovt.aftersale.common.tools.DAORowMapper;

/**
 * 载入各项配置
 * @Author lyman.meng
 * @Version 1.0
 * @See 
 * @Since [OVT AFTERSALE]/[Server] 1.0
 */
public class SysConfig
{

    private static final Log LOG = LogFactory.getLog(SysConfig.class);
    public static JdbcTemplate jdbcTemplate;
    public static final SysConfig sysConfig = new SysConfig();
    public static int cookieAccessTokenAge;
    	
    public static void updateItem(Map<String, String> itemValueMap)
    {
        try
        {
            if (jdbcTemplate == null)
            {
                jdbcTemplate = (JdbcTemplate) BeanFactoryUtil
                        .getBean("jdbcTemplate");
            }
            
            String sql = "update t_sysconfig_item set item_value = ? "
            		+ "where config_item_name = ? ";
            
            List<Object[]> batchArgs = new ArrayList<Object[]>();
            Object[] itemInfo;
            for (String itemName : itemValueMap.keySet())
            {
                itemInfo = new Object[2];
                itemInfo[0] = itemValueMap.get(itemName);
                itemInfo[1] = itemName;
                
                Field field = sysConfig.getClass().getDeclaredField(
                        itemName);
                if (field != null)
                {
                    field.set(sysConfig, itemInfo[0]);
                }
                batchArgs.add(itemInfo);
            }
            
            jdbcTemplate.batchUpdate(sql, batchArgs);
        }
        catch (Exception e)
        {
            LOG.error(e);
        }
    }

	public static void initSysConfig()
    {
        try
        {
            if (jdbcTemplate == null)
            {
                jdbcTemplate = (JdbcTemplate) BeanFactoryUtil
                        .getBean("jdbcTemplate");
            }
            String sql = " select config_item_id,config_item_name,"
            		+ "data_type_id,item_value from t_sysconfig_item ";
            List<ConfigItem> list = jdbcTemplate.query(sql,
                    new DAORowMapper<ConfigItem>(ConfigItem.class));
            for (ConfigItem item : list)
            {
                Object value = item.getItem_value();
                if (value != null && !"".equals(value))
                {
                    try
                    {
                        if (item.getData_type_id() == DataTypeConst.DT_INT)
                        {
                            value = Integer.parseInt((String) value);
                        }
                        Field field = sysConfig.getClass().getDeclaredField(
                                item.getConfig_item_name());
                        if (field != null)
                        {
                            field.set(sysConfig, value);
                        }
                    }
                    catch (Exception e)
                    {
                    	LOG.error("字段" + item.getConfig_item_name()
                                + "加载出错！");
                    }
                }
            }
        }
        catch (Exception e)
        {
        	LOG.error(e);
        }
    }

	public int getCookieAccessTokenAge() 
	{
		return cookieAccessTokenAge;
	}

	public void setCookieAccessTokenAge(int cookieAccessTokenAge) 
	{
		this.cookieAccessTokenAge = cookieAccessTokenAge;
	}
}
