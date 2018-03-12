var serverUrl = "api";
app.factory('Users', ['$http', function ($http) {
    return {
        login: function (params) {
            return $http({
                method: 'POST',
                url: serverUrl + "/user/login",
                params: params
            });
        },
        logout: function () {
            return $http({
                method: 'POST',
                url: serverUrl + "/user/logout"
            });
        }
    };
}]);

app.factory('Consult', ['$http', function ($http) {
    return {
        list: function () {
            return $http({
                method: 'POST',
                url: serverUrl + "/consult/list"
            });
        },
        replies: function (consultID) {
            return $http({
                method: 'POST',
                url: serverUrl + "/consult/reply/list",
                params: {consultID: consultID}
            });
        },
        reply: function (reply) {
            return $http({
                method: 'POST',
                url: serverUrl + "/consult/reply",
                data: reply
            });
        }
    };
}]);

app.factory('Frame', ['$http', function ($http) {
    return {
        getNavbarList: function (humanID) {
            return $http({
                method: 'POST',
                url: serverUrl + "/frame/getnavbarlist",
                params: {human_id: humanID}
            });
        },
        getTabMenu: function (humanID) {
            return $http({
                method: 'POST',
                url: serverUrl + "/frame/gettasklist",
                params: {human_id: humanID}
            });
        },
        getTabAction: function (humanID, tasklistID) {
            return $http({
                method: 'POST',
                url: serverUrl + "/frame/gettasklistmenu",
                params: {
                    human_id: humanID,
                    tasklist_id: tasklistID
                }
            });
        },
        getTableHeader: function (tasklistID) {
            return $http({
                method: 'POST',
                url: serverUrl + "/frame/gettasklistitem",
                params: {
                    tasklist_id: tasklistID
                }
            });
        },
        getTableItem: function (tasklistID, humanID) {
            return $http({
                method: 'POST',
                url: serverUrl + "/frame/getbilllist",
                params: {
                    tasklist_id: tasklistID,
                    human_id: humanID
                }
            });
        },
        filterItem: function(params) {
            return $http({
                method: 'GET',
                url: serverUrl + "/frame/filterbilllist",
                params: params
            });
        }
    };
}]);

app.factory('Sheet', ['$http', function ($http) {

    var setSheetInfo = function (funcName, params) {
        params['function'] = funcName;
        return $http({
            method: 'POST',
            url: serverUrl + "/sheet/setsheetinfo",
            params: params
        });
    };

    var getSheetInfo = function (funcName, billId) {
        return $http({
            method: 'POST',
            url: serverUrl + "/sheet/getsheetinfo",
            params: {
                bill_id: billId,
                function: funcName
            }
        });
    };

    return {
        viewBill: function (billId) {
            return $http({
                method: 'POST',
                url: serverUrl + "/sheet/viewbill",
                params: {
                    bill_id: billId,
                }
            });
        },
        modify: function (billId) {
            return getSheetInfo("modify", billId);
        },
        saveBill: function (params) {
            return setSheetInfo("savebill", params);
        },
        check: function (billId) {
            return getSheetInfo("check", billId);
        },
        saveCheck: function (params) {
            return setSheetInfo("check", params);
        },
        csApprove: function (billId) {
            return getSheetInfo("cs_approve", billId);
        },
        saveCsApprove: function (params) {
            return setSheetInfo("cs_approve", params);
        },
        acceptGoods: function (billId) {
            return getSheetInfo("accept_goods", billId);
        },
        saveAcceptGoods: function (params) {
            return setSheetInfo("accept_goods", params);
        },
        repair: function (billId) {
            return getSheetInfo("repair", billId);
        },
        saveRepair: function (params) {
            return setSheetInfo("repair", params);
        },
        exchange: function (billId) {
            return getSheetInfo("exchange", billId);
        },
        saveExchange: function (params) {
            return setSheetInfo("exchange", params);
        },
        asApprove: function (billId) {
            return getSheetInfo("as_approve", billId);
        },
        saveAsApprove: function (params) {
            return setSheetInfo("as_approve", params);
        },
        sendGoods: function (billId) {
            return getSheetInfo("send_goods", billId);
        },
        saveSendGoods: function (params) {
            return setSheetInfo("send_goods", params);
        },
        applyPay: function (billId) {
            return getSheetInfo("apply_pay", billId);
        },
        saveApplyPay: function (params) {
            return setSheetInfo("apply_pay", params);
        },
        applyPayApprove: function (billId) {
            return getSheetInfo("apply_approve", billId);
        },
        saveApplyPayApprove: function (params) {
            return setSheetInfo("apply_approve", params);
        },
        pay: function (billId) {
            return getSheetInfo("pay", billId);
        },
        savePay: function (params) {
            return setSheetInfo("pay", params);
        },
        getDictionary: function (name) {
            return $http({
                method: 'GET',
                url: serverUrl + "/sheet/getdropdownlist",
                params: {dic_name: name}
            });
        }
    };
}]);

app.factory('WorkFlow', ['$http', function ($http) {
    return {
        register: function (params) {
            return $http({
                method: 'POST',
                url: serverUrl + "/workflow/registerbill",
                params: params
            });
        },
        receiveTask: function (params) {
            return $http({
                method: 'POST',
                url: serverUrl + "/workflow/receivetask",
                params: params
            });
        },
        transit: function (params) {
            return $http({
                method: 'POST',
                url: serverUrl + "/workflow/transit",
                params: params
            });
        },
        rollback: function (params) {
            return $http({
                method: 'POST',
                url: serverUrl + "/workflow/rollback",
                params: params
            });
        },
        suspend: function (params) {
            return $http({
                method: 'POST',
                url: serverUrl + "/workflow/suspend",
                params: params
            });
        },
        unSuspend: function (params) {
            return $http({
                method: 'POST',
                url: serverUrl + "/workflow/unsuspend",
                params: params
            });
        },
        getTransitParter: function (billId, actDefId) {
            return $http({
                method: 'POST',
                url: serverUrl + "/workflow/gettransitparter",
                params: {
                    bill_id: billId,
                    act_def_id: actDefId
                }
            });
        },
        getWorkProcess: function (billId) {
            return $http({
                method: 'POST',
                url: serverUrl + "/workflow/getworkprocess",
                params: {
                    bill_id: billId
                }
            });
        },
        saveArchive: function (params) {
            return $http({
                method: 'POST',
                url: serverUrl + "/workflow/archive",
                params: params
            });
        },
        saveReopen: function (params) {
            return $http({
                method: 'POST',
                url: serverUrl + "/workflow/reopen",
                params: params
            });
        }
    };
}]);

app.factory('Summary', ['$http', '$window', '$filter', function ($http, $window, $filter) {

    var summaryQuery = function (param, url) {
        return $http({
            method: 'POST',
            url: serverUrl + "/statistics/" + url,
            data: param
        });
    };

    var exportWorkload = function (param, url) {
        var tempParam = JSON.stringify(param);
        $window.location.href = 'api/excel/export/' + url + '?tempParam=' + tempParam;

    };

    var exportSummaryQuery = function (param, url) {
        var tempParam = JSON.stringify(param);
        $window.location.href = 'api/excel/export/' + url + '?tempParam=' + tempParam;

    };
    return {
        getRegion: function (parentId) {
            return $http({
                method: 'GET',
                url: serverUrl + "/statistics/region",
                params: {parentId: parentId}
            });
        },
        getSummaryDetail: function (billIds) {
            return $http({
                method: 'GET',
                url: serverUrl + "/statistics/requery",
                params: {billIds: billIds}
            });
        },
        getSummaryResult: function (param) {
            var params = {
                startTime: $filter('date')(param.startTime, 'yyyy-MM-dd HH:mm:ss'),
                endTime: $filter('date')(param.endTime, 'yyyy-MM-dd HH:mm:ss'),
                timeUnit: param.timeUnit,
                type: param.type
            };

            var url = 'commonsummary';
            if (param.type === 'APPLYSUMMARY') {
                params.province = param.province.region_id;
                params.city = param.city.region_id;
                params.county = param.county.region_id;
                params.productType = param.productType.id;
                url = 'applysummary';
            } else if (param.type === 'APPLYQUERY') {
                params.province = param.province.region_id;
                params.city = param.city.region_id;
                params.county = param.county.region_id;
                params.applyType = param.applyType.id;
                params.phone = param.phone;
                params.sku = param.sku;
                params.phase = param.phase.id;
                url = 'applyquery';
            } else if (param.type === 'CSWORKLOAD' ||
                param.type === 'CHECKWORKLOAD' ||
                param.type === 'REPAIRWORKLOAD') {
                url = 'workload';
            } else if (param.type === 'EXPIRE') {
                params.phase = param.phase.id;
            } else if (param.type === 'REOPEN') {
                params.unit = param.unit.id;
            } else if (param.type === 'REFUND') {
                params.productType = param.productType.id;
            } else if (param.type === 'REASON') {
                params.productType = param.productType.id;
                params.applyReason = param.reason.id;
            }
            return summaryQuery(params, url);
        },
        exportSummaryResult: function (param) {
            var params = {
                startTime: $filter('date')(param.startTime, 'yyyy-MM-dd HH:mm:ss'),
                endTime: $filter('date')(param.endTime, 'yyyy-MM-dd HH:mm:ss'),
                timeUnit: param.timeUnit,
                type: param.type
            };

            var url = 'commonsummary';
            if (param.type === 'APPLYSUMMARY') {
                params.province = param.province.region_id;
                params.city = param.city.region_id;
                params.county = param.county.region_id;
                params.productType = param.productType.id;
                url = 'applysummary';
            } else if (param.type === 'APPLYQUERY') {
                params.province = param.province.region_id;
                params.city = param.city.region_id;
                params.county = param.county.region_id;
                params.applyType = param.applyType.id;
                params.phone = param.phone;
                params.sku = param.sku;
                params.phase = param.phase.id;
                url = 'applyquery';
            } else if (param.type === 'CSWORKLOAD' ||
                param.type === 'CHECKWORKLOAD' ||
                param.type === 'REPAIRWORKLOAD') {
                url = 'workload';
                return exportWorkload(params, url);
            } else if (param.type === 'EXPIRE') {
                params.phase = param.phase.id;
            } else if (param.type === 'REOPEN') {
                params.unit = param.unit.id;
            } else if (param.type === 'REFUND') {
                params.productType = param.productType.id;
            } else if (param.type === 'REASON') {
                params.productType = param.productType.id;
                params.applyReason = param.reason.id;
            }
            return exportSummaryQuery(params, url);
        }
    }
}]);

app.factory('Verify',['$http', function($http){
    return{
        getAppliedBill: function (as_apply_Id) {
            return $http({
                method: 'GET',
                url: serverUrl + "/frame/getappliedbill",
                params: {
                    as_apply_Id: as_apply_Id
                }
            });
        },
        verifyBill: function (params) {
            return $http({
                method: 'POST',
                url: serverUrl + "/workflow/verify",
                params: params
            });
        }
    }
}])

app.filter('to_trusted', ['$sce', function ($sce) {
    return function (text) {
        return $sce.trustAsHtml(text);
    }
}]);