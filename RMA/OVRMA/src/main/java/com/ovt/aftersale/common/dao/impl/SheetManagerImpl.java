/**
 * 实现表单数据的读写
 * @Author lyman.meng
 * @Version 1.0
 * @See 
 * @Since [OVT AFTERSALE]/[Server] 1.0
 */
package com.ovt.aftersale.common.dao.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.ServletRequestUtils;

import com.ovt.aftersale.common.dao.SheetManager;
import com.ovt.aftersale.common.dao.WorkFlowManager;
import com.ovt.aftersale.common.tools.DAORowMapper;
import com.ovt.aftersale.common.tools.JsonDocument;
import com.ovt.aftersale.common.vo.Bill;
import com.ovt.aftersale.common.vo.IDAndName;
import com.ovt.aftersale.common.vo.Sheet;

@Repository
public class SheetManagerImpl implements SheetManager
{
    @Autowired
    private JdbcTemplate jdbcTemplate = null;
    
    @Autowired
    protected WorkFlowManager workFlowManager;
    
//    private static final Log LOG = LogFactory.getLog(SheetManagerImpl.class);
    // 收件
    public Bill getSheetInfo(String bill_id,String function)
    {
    	String sql = "select group_concat(field) from t_sheet where "
    			+ "is_deleted = 0 and rw = 0 and function = ?";
        String tasklistItem = jdbcTemplate.queryForObject(sql, String.class, function);
        sql = "select " + tasklistItem + " from t_bill where bill_id = ?";
        Bill bill = jdbcTemplate.query(sql, new DAORowMapper<Bill>(
    			Bill.class), bill_id).get(0);
        return bill;
    }
    
    public JsonDocument setSheetInfo(String billID,String function,HttpServletRequest request) throws Exception
    {
    	String sql = "select field,field_type from t_sheet where "
    			+ "is_deleted = 0 and rw = 1 and function = ?";
    	List<Sheet> sheet = jdbcTemplate.query(sql, new DAORowMapper<Sheet>(
    			Sheet.class), function);
    	String updateSql = "";
    	for(int i = 0; i < sheet.size(); i ++)
    	{
    		int intValue = -1;
    		String stringValue = "";
    		if(1 == sheet.get(i).getField_type())
    		{
    			intValue = ServletRequestUtils.getIntParameter(request, sheet.get(i).getField());
    			updateSql += sheet.get(i).getField() + "=" + intValue + ",";
    		}
    		else
    		{
    			stringValue = ServletRequestUtils.getStringParameter(request, sheet.get(i).getField());
    			updateSql += sheet.get(i).getField() + "='" + stringValue + "',";
    		}
    	}
    	sql = "update t_bill set " + updateSql.substring(0, updateSql.length() - 1)
    	 		+ " where bill_id = ?";
    	jdbcTemplate.update(sql,billID);
    	//审核不通过时需要回退,特殊处理
    	if("cs_approve".equals(function))
    	{
    	    int csApproveResultID = ServletRequestUtils.getIntParameter(request, "cs_approve_result_id");
    	    if(2 == csApproveResultID)
    	    {
        	    String actID = ServletRequestUtils.getStringParameter(request,"act_id");
        	    approveBack(billID, actID);
    	    }
    	}
    	if("as_approve".equals(function))
    	{
            int asApproveResultID = ServletRequestUtils.getIntParameter(request, "as_approve_result_id");
            if(2 == asApproveResultID)
            {
                String actID = ServletRequestUtils.getStringParameter(request,"act_id");
                approveBack(billID, actID);
            }
        }
    	return new JsonDocument();
    }
    
    private void approveBack(String billID,String actID)
    {
        workFlowManager.rollback(billID, actID, "审核不通过");
    }
    
    public List<IDAndName> getDictionary(String dicName)
    {
        String sql = "select " + dicName + "_id as id," + dicName 
                + "_name as name from t_dic_" + dicName;
        List<IDAndName> keyAndValues = jdbcTemplate.query(sql, new DAORowMapper<IDAndName>(
                IDAndName.class));
        return keyAndValues;
    }
}
