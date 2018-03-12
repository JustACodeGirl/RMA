package com.ovt.aftersale.common.dao;

import com.ovt.aftersale.common.tools.JsonDocument;

/**
 * 工作流管理类
 * UserLogonManager
 * 
 * @Author lyman.meng
 * @Version 1.0
 * @See 
 * @Since [OVT AFTERSALE]/[Server] 1.0
 */
public interface WorkFlowManager
{
    /**
     * 收件
     * @param billID
     * @param actID
     * @param humanID
     * @return
     */
    public JsonDocument receiveTask(String billID, String actID, int humanID);

    /**
     * 登记
     * @param applyTypeID
     * @param clientName
     * @param accountName
     * @param phone
     * @param address
     * @param buyTime
     * @param SKU
     * @param goodsTypeID
     * @param faultDescription
     * @param humanID
     * @return
     */
    public JsonDocument registerBill(int applyTypeID, String clientName,
            String accountName, String phone, String address, String buyTime,
            String SKU, int goodsTypeID, int damageTypeID,
            String faultDescription,int cardBankID,String cardNo,int humanID);

    /**
     * 批转
     * @param billID
     * @param actID
     * @param fromHumanID
     * @param toRolePartID
     * @return
     */
    public JsonDocument transit(String billID, String actID, int fromHumanID, int toRolePartID, String transitMemo);

    /**
     * 回退
     * @param billID
     * @param actID
     * @return
     */
    public JsonDocument rollback(String billID, String actID, String rollBackMemo);

    /**
     * 挂起
     * @param billID
     * @param actID
     * @return
     */
    public JsonDocument suspend(String billID, String actID, String suspendMemo);
    
    /**
     * 挂起
     * @param billID
     * @param actID
     * @return
     */
    public JsonDocument unSuspend(String billID, String actID, String unSuspendMemo);
    
    /**
     * 办结
     * @param billID
     * @param actID
     * @return
     */
    public JsonDocument archive(String billID, String actID, String archiveMemo);
    
    /**
     * 重启
     * @param billID
     * @param actID
     * @return
     */
    public JsonDocument reopen(String billID, String actID, String reopenMemo);

    /**
     * 获取下阶段批转对象
     * @param actDefID
     * @return
     */
    public JsonDocument getTransitParter(int actDefID,int billID);

    /**
     * 获取案件办理流程
     * @param billID
     * @return
     */
    public JsonDocument getWorkProcess(String billID);
}
