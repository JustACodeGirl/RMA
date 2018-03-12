/**
 * Created by leo.liu on 2016/2/29.
 */
'use strict'

var dataTool = {
    set: function (key, value) {
        return window.localStorage.setItem(key, value);
    },
    get: function (key) {
        return window.localStorage.getItem(key);
    },
    delete: function (key) {
        return window.localStorage.removeItem(key);
    }
};

var errorCodeMap = {
    UserNameOrPasswordWrong: '用户名或密码错误！',
    BillListIsEmpty: '没有查到任何案件！',
    InvalidRoleFlag: '传入的角色标志无效！',
    CannotGetHuman: '获取相应角色下的人员失败！',
    CannotGetWorkload: '获取该角色处理的案件失败！',
    TimescaleIsEmpty: '时间范围为空，无效！',
    StatisticsDataIsNull: '返回的统计数据对象为null！',
    FailDownloadFailed: '下载Excel文件出错！',
    JsonToObjectFailed: 'Json 字符串转换成对象出错！',
    WrongPassword: '原始密码错误',
    InvalidPassword: '密码格式错误',
    NewAndOldPasswordIsSame: '新密码与旧密码相同',
    SystemUnexpected: '系统内部错误',
    DBAccessFailed: '数据库访问失败',
    GetRegionFailed: '获取地区列表失败',
    RequeryBillDatailFailed: '反查案件详情失败',
    GetSummaryFailed: '获取统计结果失败',
    GetApplySummaryFailed: '统计案件数量失败',
    QueryBillsInfoFailed: '查询案件信息失败',
    ServerInternalException: '系统内部错误',
    UserNotRegistered: '用户未注册',
    UserNotLogin: '用户未登录',
    Assigned: '案件已被受理',
    Transited: '案件已被批转',
    ActNotExist: '操作步骤不存在',
    SetSheetWrong: '保存表单数据失败',
    GetDictionaryWrong: '加载下拉列表项失败',
    FestivalExist: '节日已经存在',
    UserHasExisted: '用户名已存在',
    RoleHasExisted: '角色名已存在',
    InvalidAccessToken: '无效的访问令牌'
};