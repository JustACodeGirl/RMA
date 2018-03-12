package com.ovt.aftersale.common.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ovt.aftersale.common.dao.WorkFlowManager;
import com.ovt.aftersale.common.tools.JsonDocument;

/**
 * SystemConfigController
 * @Author zhi.liu
 * @Version 1.0
 * @See 
 * @Since [OVT AFTERSALE]/[Server] 1.0
 */
@Controller
@RequestMapping("/workflow")
public class WorkFlowController
{
	@Autowired
	protected WorkFlowManager workFlowManager;
	
	/**
	 * 登记案件,工作流初始节点
	 * @param request
	 * @return
	 */
    @RequestMapping(method = RequestMethod.POST,value = "/registerbill")
    @ResponseBody
    public JsonDocument registerBill(HttpServletRequest request)
    {
    	int applyTypeID = ServletRequestUtils.getIntParameter(request,"apply_type_id", -1);
        String clientName = ServletRequestUtils.getStringParameter(request,"client_name", "");
        String accountName = ServletRequestUtils.getStringParameter(request,"account_name", "");
        String phone = ServletRequestUtils.getStringParameter(request,"phone", "");
        String address = ServletRequestUtils.getStringParameter(request,"address", "");
        String buyTime = ServletRequestUtils.getStringParameter(request,"buy_time", "");
        String SKU = ServletRequestUtils.getStringParameter(request,"sku", "");
        int goodsTypeID = ServletRequestUtils.getIntParameter(request,"goods_type_id", -1);
        int damageTypeID = ServletRequestUtils.getIntParameter(request,"damage_type_id", -1);
        int humanID = ServletRequestUtils.getIntParameter(request,"human_id", -1);
        int cardBankID = ServletRequestUtils.getIntParameter(request,"card_bank_id", -1);
        String cardNo = ServletRequestUtils.getStringParameter(request,"card_no", "");
        String faultDescription = ServletRequestUtils.getStringParameter(request,"fault_description", "");
        JsonDocument result = workFlowManager.registerBill(applyTypeID, clientName, 
        		accountName, phone, address, buyTime, SKU, goodsTypeID,damageTypeID,
        		faultDescription,cardBankID,cardNo,humanID);
        return result;
    }

    /**
     * 收件
     * @param request
     * @return
     */
    @RequestMapping(method = RequestMethod.POST,value = "/receivetask")
    @ResponseBody
    public JsonDocument receiveTask(HttpServletRequest request)
    {
        String billID = ServletRequestUtils.getStringParameter(request,"bill_id", "");
        String actID = ServletRequestUtils.getStringParameter(request,"act_id", "");
        int humanID = ServletRequestUtils.getIntParameter(request,"human_id", -1);
        JsonDocument result = workFlowManager.receiveTask(billID, actID, humanID);
        return result;
    }
    
    /**
     * 批转
     * @param request
     * @return
     */
    @RequestMapping(method = RequestMethod.POST,value = "/transit")
    @ResponseBody
    public JsonDocument transit(HttpServletRequest request)
    {
    	String billID = ServletRequestUtils.getStringParameter(request,"bill_id", "");
        String actID = ServletRequestUtils.getStringParameter(request,"act_id", "");
        int fromHumanID = ServletRequestUtils.getIntParameter(request,"from_human_id", -1);
        int toRoleID = ServletRequestUtils.getIntParameter(request,"to_role_id", -1);
        String transitMemo = ServletRequestUtils.getStringParameter(request,"transit_memo", "");
        JsonDocument result = workFlowManager.transit(billID, actID, fromHumanID, toRoleID,transitMemo);
        return result;
    }

    /**
     * 回退，直接回退到上阶段办理人，不回退到角色
     * @param request
     * @return
     */
    @RequestMapping(method = RequestMethod.POST,value = "/rollback")
    @ResponseBody
    public JsonDocument rollback(HttpServletRequest request)
    {
    	String billID = ServletRequestUtils.getStringParameter(request,"bill_id", "");
        String actID = ServletRequestUtils.getStringParameter(request,"act_id", "");
        String rollBackMemo = ServletRequestUtils.getStringParameter(request,"rollback_memo", "");
        JsonDocument result = workFlowManager.rollback(billID, actID,rollBackMemo);
        return result;
    }

    /**
     * 挂起案件停止计时，并且不能进行业务操作
     * 1.0版本不考虑计时
     * @param request
     * @return
     */
    @RequestMapping(method = RequestMethod.POST,value = "/suspend")
    @ResponseBody
    public JsonDocument suspend(HttpServletRequest request)
    {
    	String billID = ServletRequestUtils.getStringParameter(request,"bill_id", "");
        String actID = ServletRequestUtils.getStringParameter(request,"act_id", "");
        String suspendMemo = ServletRequestUtils.getStringParameter(request,"suspend_memo", "");
        JsonDocument result = workFlowManager.suspend(billID, actID, suspendMemo);
        return result;
    }
    
    @RequestMapping(method = RequestMethod.POST,value = "/unsuspend")
    @ResponseBody
    public JsonDocument unSuspend(HttpServletRequest request)
    {
    	String billID = ServletRequestUtils.getStringParameter(request,"bill_id", "");
        String actID = ServletRequestUtils.getStringParameter(request,"act_id", "");
        String unSuspendMemo = ServletRequestUtils.getStringParameter(request,"unsuspend_memo", "");
        JsonDocument result = workFlowManager.unSuspend(billID, actID, unSuspendMemo);
        return result;
    }
    
    @RequestMapping(method = RequestMethod.POST,value = "/archive")
    @ResponseBody
    public JsonDocument archive(HttpServletRequest request)
    {
        String billID = ServletRequestUtils.getStringParameter(request,"bill_id", "");
        String actID = ServletRequestUtils.getStringParameter(request,"act_id", "");
        String archiveMemo = ServletRequestUtils.getStringParameter(request,"archive_memo", "");
        JsonDocument result = workFlowManager.archive(billID, actID,archiveMemo);
        return result;
    }
    
    @RequestMapping(method = RequestMethod.POST,value = "/reopen")
    @ResponseBody
    public JsonDocument reopen(HttpServletRequest request)
    {
        String billID = ServletRequestUtils.getStringParameter(request,"bill_id", "");
        String actID = ServletRequestUtils.getStringParameter(request,"act_id", "");
        String reopenMemo = ServletRequestUtils.getStringParameter(request,"reopen_memo", "");
        JsonDocument result = workFlowManager.archive(billID, actID,reopenMemo);
        return result;
    }

    /**
     * 批转页面中，获取下一阶段的批转对象
     * @param request
     * @return
     */
    @RequestMapping(method = RequestMethod.POST,value = "/gettransitparter")
    @ResponseBody
    public JsonDocument getTransitParter(HttpServletRequest request)
    {
    	int actDefID = ServletRequestUtils.getIntParameter(request,"act_def_id", -1);
    	int billID = ServletRequestUtils.getIntParameter(request,"bill_id", -1);
        JsonDocument result = workFlowManager.getTransitParter(actDefID,billID);
        return result;
    }

    /**
     * 查看案件办理流程
     * @param request
     * @return
     */
    @RequestMapping(method = RequestMethod.POST,value = "/getworkprocess")
    @ResponseBody
    public JsonDocument getWorkProcess(HttpServletRequest request)
    {
    	String billID = ServletRequestUtils.getStringParameter(request,"bill_id", "");
        JsonDocument result = workFlowManager.getWorkProcess(billID);
        return result;
    }
}
