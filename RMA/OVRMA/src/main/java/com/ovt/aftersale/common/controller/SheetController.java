package com.ovt.aftersale.common.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ovt.aftersale.common.dao.SheetManager;
import com.ovt.aftersale.common.tools.JsonDocument;
import com.ovt.aftersale.common.vo.Bill;
import com.ovt.aftersale.common.vo.IDAndName;

/**
 * 页面框架控制类，为导航栏、任务列表等公用界面提供数据接口
 * @Author lyman.meng
 * @Version 1.0
 * @See 
 * @Since [OVT AFTERSALE]/[Server] 1.0
 */
@Controller
@RequestMapping("/sheet")
public class SheetController
{
	@Autowired
	protected SheetManager sheetManager;
	
	/**
	 * 读取表单
	 * @param request
	 * @return
	 */
    @RequestMapping(method = RequestMethod.POST, value = "/getsheetinfo")
    @ResponseBody
    public JsonDocument getSheetInfo(HttpServletRequest request)
    {
        String bill_id = ServletRequestUtils.getStringParameter(request, "bill_id","");
        String function = ServletRequestUtils.getStringParameter(request, "function","");
        Bill bill = sheetManager.getSheetInfo(bill_id, function);
        return new JsonDocument(bill);
    }
    
	/**
	 * 写入表单
	 * @param request
	 * @return
	 */
    @RequestMapping(method = RequestMethod.POST, value = "/setsheetinfo")
    @ResponseBody
    public JsonDocument setSheetInfo(HttpServletRequest request)
    {
        String bill_id = ServletRequestUtils.getStringParameter(request, "bill_id","");
        String function = ServletRequestUtils.getStringParameter(request, "function","");
        JsonDocument result;
		try {
			result = sheetManager.setSheetInfo(bill_id, function, request);
		} catch (Exception e) {
			return new JsonDocument("SetSheetWrong");
		}
        return result;
    }
    /**
     * 获取字典表数据
     * @param request
     * @return
     */
    @RequestMapping(method = RequestMethod.POST, value = "/getdropdownlist")
    @ResponseBody
    public JsonDocument getDicInfo(HttpServletRequest request)
    {
        String dicName = ServletRequestUtils.getStringParameter(request, "dic_name","");
        try 
        {
            List<IDAndName> keyAndValues = sheetManager.getDictionary(dicName);
            return new JsonDocument(keyAndValues);
        } catch (Exception e) 
        {
            return new JsonDocument("SetSheetWrong");
        }
    }
}