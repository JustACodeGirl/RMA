package com.ovt.aftersale.common.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.ovt.aftersale.common.tools.JsonDocument;
import com.ovt.aftersale.common.vo.Bill;
import com.ovt.aftersale.common.vo.IDAndName;

/**
 * 登陆管理类
 * @Author zhi.liu
 * @Version 1.0
 * @See
 * @Since [OVT AFTERSALE]/[Server] 1.0
 */
public interface SheetManager
{
	public Bill getSheetInfo(String bill_id,String function);
	
	public JsonDocument setSheetInfo(String bill_id,String function,HttpServletRequest request) throws Exception;
	
	public List<IDAndName> getDictionary(String dicName);
}
