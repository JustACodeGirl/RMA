/**
 * 工作流管理实现类
 * @Author lyman.meng
 * @Version 1.0
 * @See 
 * @Since [OVT AFTERSALE]/[Server] 1.0
 */
package com.ovt.aftersale.common.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.ovt.aftersale.common.dao.WorkFlowManager;
import com.ovt.aftersale.common.tools.DAORowMapper;
import com.ovt.aftersale.common.tools.JsonDocument;
import com.ovt.aftersale.common.vo.Bill;
import com.ovt.aftersale.common.vo.BillAct;
import com.ovt.aftersale.common.vo.Role;

/**
 * 1系统作息时间表(t_sys_schedule) 2系统节日表(t_sys_festival) 3活动定义表(t_wf_act_def)
 * 4工作流活动属性字典表(t_dic_act_property) 5工作流流向定义表(t_wf_trans_def)
 * 6工作流活动参与者表(t_wf_act_parter) 7工作流活动工作项类型表(t_wf_act_item_type)
 * 8工作流工作项类型字典表(t_wf_dic_item_type) 9售后服务单表 (t_bill) 10服务单活动实例表(t_bill_act)
 * 11服务单活动项表(t_bill_item)
 */
// 更新、插入语句不要抓异常，否则spring无法进行事物处理
@Repository
public class WorkFlowManagerImpl implements WorkFlowManager
{
    @Autowired
    private JdbcTemplate jdbcTemplate = null;
    private static final Log LOG = LogFactory.getLog(WorkFlowManagerImpl.class);

    // 收件
    public JsonDocument receiveTask(String billID, String actID, int humanID)
    {
        String sql = "select count(1) from t_bill_act where human_id = ?"
                + " and bill_id = ? and act_id = ?";
        int count = jdbcTemplate.queryForObject(sql, Integer.class, humanID,
                billID, actID);
        if (0 < count)
        {
            return new JsonDocument("Assigned");
        }
        // 1。更新表(t_bill_act)中的操作人,在数据库中用触发器更新part_name,end_time
        sql = "update t_bill_act set human_id = ? where bill_id = ?"
                + " and act_id = ?";
        jdbcTemplate.update(sql, humanID, billID, actID);
        return new JsonDocument();
    }

    // 登记案件,工作流初始节点
    public JsonDocument registerBill(final int applyTypeID,
            final String clientName, final String accountName,
            final String phone, final String address, final String buyTime,
            final String SKU, final int goodsTypeID, final int damageTypeID,
            final String faultDescription, final int cardBankID,
            final String cardNo, final int humanID)
    {
        // 1.插入t_bill表,时间字段要转换，暂时不知mysql怎么转
        final String sql = "insert into t_bill(apply_type_id,client_name,account_name,"
                + "phone,address,buy_time,sku,goods_type_id,damage_type_id,"
                + "fault_description,accept_human_id,card_bank_id,card_no,accept_time,act_property_id)"
                + " values(?,?,?,?,?,?,?,?,?,?,?,?,?,now(),1)";
        // 2。插入t_bill_act表,初始阶段的actDefID定为101
        // actID数据库自增,partName,rolePartID,rolePartName由数据库触发器生成
        KeyHolder keyHolder = new GeneratedKeyHolder();
        jdbcTemplate.update(new PreparedStatementCreator()
        {
            @Override
            public PreparedStatement createPreparedStatement(
                    Connection connection) throws SQLException
            {
                PreparedStatement ps = connection.prepareStatement(sql,
                        PreparedStatement.RETURN_GENERATED_KEYS);
                ps.setInt(1, applyTypeID);
                ps.setString(2, clientName);
                ps.setString(3, accountName);
                ps.setString(4, phone);
                ps.setString(5, address);
                ps.setDate(6, Date.valueOf(buyTime));
                ps.setString(7, SKU);
                ps.setInt(8, goodsTypeID);
                ps.setInt(9, damageTypeID);
                ps.setString(10, faultDescription);
                ps.setInt(11, humanID);
                ps.setInt(12, cardBankID);
                ps.setString(13, cardNo);
                return ps;
            }
        }, keyHolder);
        int billID = keyHolder.getKey().intValue();
        // roleID设置为工作流起始roleID
        String roleSql = "select a.part_id from t_wf_act_part a ,t_wf_act_def b where a.act_def_id = b.act_def_id and b.act_def_type = 1";
        int roleID = jdbcTemplate.queryForObject(roleSql, Integer.class);
        String actSql = "insert into t_bill_act(bill_id,human_id,role_id,act_def_id,act_state_id,operation) values (?,?,?,?,1,'登记案件')";
        jdbcTemplate.update(actSql, billID, humanID, roleID, 1);
        return new JsonDocument();
    }

    // 批转
    public JsonDocument transit(String billID, String actID, int fromHumanID,
            int toRolePartID, String transitMemo)
    {
        String sql = "select act_def_id from t_wf_act_part where part_id = ?";
        int toActDefID = jdbcTemplate.queryForObject(sql, Integer.class,
                toRolePartID);
        updateActPropertyID(billID, toActDefID);
        sql = "select display_name from t_role where role_id = ?";
        String toRoleName = jdbcTemplate.queryForObject(sql, String.class,
                toRolePartID);
        int actStateID = 2;
        int humanID = -1;
        sql = "select role_id,role_name,human_id,pre_human_id,act_def_id,act_state_id,operation from t_bill_act where bill_id = ?"
                + " and act_id = ?";
        BillAct billAct = jdbcTemplate.query(sql,
                new DAORowMapper<BillAct>(BillAct.class), billID, actID).get(0);
        String operation = billAct.getOperation();
        if (2 == billAct.getAct_state_id())
        {
            operation = "批转至" + toRoleName;
        }
        if (8 == billAct.getAct_def_id())
        {
            humanID = billAct.getPre_human_id();
        }
        if (12 == toActDefID)
        {
            actStateID = 5;
            sql = "select accept_human_id from t_bill where bill_id = ?";
            humanID = jdbcTemplate.queryForObject(sql, Integer.class, billID);
        }
        sql = "update t_bill_act set end_time = now(),operation = ? where bill_id = ? and act_id = ?";
        jdbcTemplate.update(sql, operation, billID, actID);
        if (((null != billAct.getAct_def_id()) && (8 == billAct.getAct_def_id()))
                || (12 == toActDefID))
        {
            sql = "insert into t_bill_act (bill_id,pre_role_id,role_id,human_id,pre_act_id,"
                    + "pre_human_id,pre_act_def_id,act_def_id,act_state_id,start_time,transit_memo) "
                    + "values(?,?,?,?,?,?,?,?,?,now(),?)";
            jdbcTemplate.update(sql, billID, billAct.getRole_id(),
                    toRolePartID, humanID, actID, humanID,
                    billAct.getAct_def_id(), toActDefID, actStateID, transitMemo);
        }
        else
        {
            sql = "insert into t_bill_act (bill_id,pre_role_id,role_id,pre_act_id,"
                    + "pre_human_id,pre_act_def_id,act_def_id,act_state_id,start_time,transit_memo) "
                    + "values(?,?,?,?,?,?,?,?,now(),?)";
            jdbcTemplate.update(sql, billID, billAct.getRole_id(),
                    toRolePartID, actID, billAct.getHuman_id(),
                    billAct.getAct_def_id(), toActDefID, actStateID, transitMemo);
        }
        return new JsonDocument();
    }

    /**
     * 回退，直接回退到上阶段办理人，不回退到角色
     */
    public JsonDocument rollback(String billID, String actID, String rollbackMemo)
    {
        // 1.生成回退活动实例
        String sql = "select role_id,role_name,pre_role_id,pre_role_name,act_id,"
                + "human_id,act_def_id,pre_act_def_id,pre_human_id from t_bill_act where "
                + "bill_id = ? and act_id = ?";
        BillAct billAct = jdbcTemplate.query(sql,
                new DAORowMapper<BillAct>(BillAct.class), billID, actID).get(0);
        sql = "select display_name from t_role where role_id = ?";
        String toRoleName = jdbcTemplate.queryForObject(sql, String.class,
                billAct.getPre_role_id());
        String operation = "回退至" + toRoleName;
        sql = "update t_bill_act set end_time = now(),act_state_id = 4,operation = ? where bill_id = ? and act_id = ?";
        jdbcTemplate.update(sql, operation, billID, actID);
        sql = "insert into t_bill_act (bill_id,pre_role_id,role_id,pre_act_id,pre_human_id"
                + ",pre_act_def_id,act_def_id,human_id,act_state_id,rollback_memo) values(?,?,?,?,?,?,?,?,4,?)";
        jdbcTemplate.update(sql, billID, billAct.getRole_id(),
                billAct.getPre_role_id(), billAct.getAct_id(),
                billAct.getHuman_id(), billAct.getAct_def_id(),
                billAct.getPre_act_def_id(), billAct.getPre_human_id(),rollbackMemo);
        updateActPropertyID(billID, billAct.getPre_act_def_id());
        return new JsonDocument();
    }

    /**
     * 挂起案件停止计时，并且不能进行业务操作
     */
    public JsonDocument suspend(String billID, String actID, String suspendMemo)
    {
        String sql = "update t_bill_act set act_state_id = 3,operation ='挂起案件',suspend_memo = ? where bill_id = ?"
                + " and act_id = ?";
        jdbcTemplate.update(sql, billID, actID);
        return new JsonDocument();
    }

    public JsonDocument unSuspend(String billID, String actID, String unSuspendMemo)
    {
        // 解除挂起案件需要增加一条act纪录么
        String sql = "update t_bill_act set act_state_id = 2,operation ='解除挂起案件',unsuspend_memo = ? where bill_id = ?"
                + " and act_id = ?";
        jdbcTemplate.update(sql, unSuspendMemo,billID, actID);
        return new JsonDocument();
    }

    /**
     * 办结
     */
    public JsonDocument archive(String billID, String actID, String archiveMemo)
    {
        String sql = "update t_bill_act set act_state_id = 6,operation = '办结案件' where bill_id = ?"
                + " and act_id = ?";
        jdbcTemplate.update(sql, billID, actID);
        sql = "update t_bill set archive_memo = ? where bill_id = ?";
        jdbcTemplate.update(sql, archiveMemo, billID);
        return new JsonDocument();
    }

    /**
     * 重开
     */
    public JsonDocument reopen(String billID, String actID, String reopenMemo)
    {
        String sql = "update t_bill_act set act_state_id = 1,operation = '重启案件' where bill_id = ?"
                + " and act_id = ?";
        jdbcTemplate.update(sql, billID, actID);
        sql = "update t_bill set reopenMemo = ? where bill_id = ?";
        jdbcTemplate.update(sql, reopenMemo, billID);
        return new JsonDocument();
    }

    // 获取批转对象树列表，目前只认为职能按岗位划分，不考虑按照部门划分等情况
    public JsonDocument getTransitParter(int actDefID, int billID)
    {
        String sql = "select c.role_id,c.role_name,c.display_name"
                + " from t_wf_act_part a,t_wf_trans_def b,t_role "
                + "c,t_wf_act_def d where a.act_def_id = b.to_act_def_id and a.part_id"
                + " = c.role_id and c.is_deleted = 0 and b.from_act_def_id = ? "
                + "and a.act_def_id = d.act_def_id";
        if (4 == actDefID || 5 == actDefID || 6 == actDefID || 8 == actDefID)
        {
            sql = filterSql(sql, billID, actDefID);
        }
        List<Role> roleList = new ArrayList<Role>();
        try
        {
            roleList = jdbcTemplate.query(sql, new DAORowMapper<Role>(
                    Role.class), actDefID);
        }
        catch (Exception e)
        {
            LOG.error("获取批转对象失败!", e);
        }
        JsonDocument result = new JsonDocument(roleList);
        return result;
    }

    private String filterSql(String sql, int billID, int actDefID)
    {
        // 查询此案件在质检部门决定的流向
        String actSql = "select check_result_id,as_approve_human_id,as_approve_result_id from t_bill where bill_id = ?";
        Bill bill = jdbcTemplate.query(actSql,
                new DAORowMapper<Bill>(Bill.class), billID).get(0);
        if (4 == actDefID || 8 == actDefID)// 不予处理
        {
            int checkResultID = bill.getCheck_result_id();
            if (1 == checkResultID)
            {
                sql += " and d.act_def_name like '%结案%'";
            }
            if (2 == checkResultID)
            {
                sql += " and d.act_def_name like '%会计%'";
            }
            if (3 == checkResultID)
            {
                sql += " and d.act_def_name like '%换货%'";
            }
            if (4 == checkResultID)
            {
                sql += " and d.act_def_name like '%维修%'";
            }
        }
        if (5 == actDefID || 6 == actDefID)
        {
            Integer asApproveHumanID = bill.getAs_approve_human_id();
            if (null == asApproveHumanID)
            {
                sql += " and d.act_def_name like '%售后主管%'";
            }
            else
            {
                if(2 == bill.getAs_approve_result_id())
                {
                    sql += " and d.act_def_name like '%售后主管%'";
                }
                else
                {
                    sql += " and d.act_def_name like '%发货%'";
                }
            }
        }
        return sql;
    }

    // 查看工作流程办理数据
    public JsonDocument getWorkProcess(String billID)
    {
        List<BillAct> actItemList = new ArrayList<BillAct>();
        String sql = "select human_name,unit_name,end_time,"
                + "operation from t_bill_act where bill_id = ?";
        try
        {
            actItemList = jdbcTemplate.query(sql, new DAORowMapper<BillAct>(
                    BillAct.class), billID);
        }
        catch (Exception e)
        {
            LOG.error("获取工作流程办理数据失败!", e);
        }
        JsonDocument result = new JsonDocument(actItemList);
        return result;
    }

    // 获取当前案件的阶段
    private void updateActPropertyID(String billID,int actDefID)
    {
        String sql = "update t_bill set act_property_id = (select act_property_id from t_wf_act_def "
                + "where act_def_id = ?) where bill_id = ?";
        jdbcTemplate.update(sql, actDefID,billID);
    }
}
