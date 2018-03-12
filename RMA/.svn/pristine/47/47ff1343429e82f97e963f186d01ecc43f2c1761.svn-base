/**
 * Created by leo.liu on 2016/3/1.
 */
app.controller('PublicModalController', ['$scope', 'WorkFlow', 'Sheet', '$filter', 'Frame', function ($scope, WorkFlow, Sheet, $filter, Frame) {
    $scope.transitInfo = {};
    $scope.rollbackInfo = {};
    $scope.suspendInfo = {};
    $scope.paramsCache = [];
    var isEmpty = function(key){
        if(key == undefined || key == null || key == ''){
            return true;
        }
        return false;
    }
    $scope.transit = function (transitInfo, valid) {
        if(!valid){
            return false;
        }
        jQuery('#transit').modal('hide');
        transitInfo.bill_id = $scope.selectTableItem.bill_id;
        transitInfo.act_id = $scope.selectTableItem.act_id;
        transitInfo.from_human_id = $scope.adminInfo.human_id;
        if ($scope.selectRole == undefined || $scope.selectRole == null) {
            toast('error', '', '无效的批转对象!', null);
        } else {
            transitInfo.to_role_id = $scope.selectRole.role_id;
            WorkFlow.transit(transitInfo).success($scope.refreshItem);
        }
    };

    $scope.rollback = function (rollbackInfo, valid) {
        if(!valid){
            return false;
        }
        jQuery('#rollback').modal('hide');
        rollbackInfo.bill_id = $scope.selectTableItem.bill_id;
        rollbackInfo.act_id = $scope.selectTableItem.act_id;
        WorkFlow.rollback(rollbackInfo).success($scope.refreshItem);
    };

    $scope.suspend = function (suspendInfo, valid) {
        if(!valid){
            return false;
        }
        jQuery('#suspend').modal('hide');
        suspendInfo.bill_id = $scope.selectTableItem.bill_id;
        suspendInfo.act_id = $scope.selectTableItem.act_id;
        WorkFlow.suspend(suspendInfo).success($scope.refreshItem);
    };

    $scope.unSuspend = function (unSuspendInfo) {
        unSuspendInfo.bill_id = $scope.selectTableItem.bill_id;
        unSuspendInfo.act_id = $scope.selectTableItem.act_id;
        WorkFlow.unSuspend(unSuspendInfo).success($scope.refreshItem);
    };

    $scope.filterSearch = function (valid) {
        if (!valid) {
            return false;
        }
        jQuery('#filter').modal('hide');
        var params = {
            human_id: $scope.adminInfo.human_id,
            tasklist_id: $scope.selectTabMenuId,
            apply_type_id: $scope.filterData.selectApplyType.id,
            goods_type_id: $scope.filterData.selectProductType.id,
            client_name: $scope.filterData.client_name,
            apply_reason_id: $scope.filterData.reason.id,
            phone: $scope.filterData.phone,
            bill_no: $scope.filterData.billNumber
        };
        $scope.paramsCache = [$scope.filterData.selectApplyType.id - 1, $scope.filterData.selectProductType.id - 1, $scope.filterData.client_name,
            $scope.filterData.reason.id - 1, $scope.filterData.phone, $scope.filterData.billNumber];
        Frame.filterItem(params).success(function (response) {
            $scope.app.tableItemList[$scope.selectTabMenuId] = response.data;
            $scope.haveSelected = false;
            angular.forEach($scope.app.tableItemList[$scope.selectTabMenuId], function (tableItem) {
                tableItem.selected = false;
            });
        });
    };

    $scope.$on('transit', function (event, data) {
        if (data.toString() === 'init') {
            $scope.transitInfo = {};
            WorkFlow.getTransitParter($scope.selectTableItem.bill_id, $scope.selectTableItem.act_def_id)
                .success(function (response) {
                    $scope.targetRoles = response.data;
                    $scope.selectRole = $scope.targetRoles[0];
                });
        }
    });

    $scope.$on('suspend', function (event, data) {
        if (data.toString() === 'init') {
            $scope.suspendInfo = {};
        }
    });

    $scope.$on('unsuspend', function (event, data) {
        if (data.toString() === 'init') {
            $scope.unSuspendInfo = {};
        }
    });

    $scope.$on('rollback', function (event, data) {
        if (data.toString() === 'init') {
            $scope.rollbackInfo = {};
        }
    });

    $scope.$on('viewprocess', function (event, data) {
        if (data.toString() === 'init') {
            WorkFlow.getWorkProcess($scope.selectTableItem.bill_id).success(function (response) {
                $scope.flowInfos = response.data;
                console.log($scope.flowInfos);
            });
        }
    });

    $scope.$on('viewbill', function (event, data) {
        Sheet.viewBill(data).success(function (response) {
            $scope.billInfo = response.data;
            $scope.billInfo.applyType = $scope.applyTypes[$scope.billInfo.apply_type_id - 1];
            $scope.billInfo.productType = $scope.productTypes[$scope.billInfo.goods_type_id - 1];
            $scope.billInfo.checkResult = $scope.checkResults[$scope.billInfo.check_result_id - 1];
            $scope.billInfo.buyTime = $filter('date')($scope.billInfo.buy_time, 'yyyy-MM-dd');
            $scope.billInfo.processTime = $filter('date')($scope.billInfo.accept_time, 'yyyy-MM-dd HH:mm:ss');
            $scope.billInfo.check_time = $filter('date')($scope.billInfo.check_time, 'yyyy-MM-dd HH:mm:ss');
            if($scope.billInfo.remain_time < 0){
                $scope.billInfo.stepLeftTime = 0;
            }else{
                $scope.billInfo.stepLeftTime = $scope.beautifyTime($scope.billInfo.remain_time);
            }
            $scope.billInfo.stepUsedTime = $scope.beautifyTime($scope.billInfo.used_time)
        });
    });

    $scope.$on('receive_bill', function (event, data) {
        if (data.toString() === 'init') {
            var data = {
                bill_id: $scope.selectTableItem.bill_id,
                act_id: $scope.selectTableItem.act_id,
                human_id: $scope.adminInfo.human_id
            };
            WorkFlow.receiveTask(data).success($scope.refreshItem);
        }
    });

    //filter
    $scope.$on('filter', function (event, data) {
        if (data.toString() === 'init') {
            $scope.filterData = {};
            $scope.filterData.selectApplyType = $scope.applyTypes[$scope.paramsCache[0]] || $scope.applyTypes[3];
            $scope.filterData.selectProductType = $scope.productTypes[$scope.paramsCache[1]] || $scope.productTypes[2];
            $scope.filterData.reason = $scope.applyReasons[$scope.paramsCache[3]] || $scope.applyReasons[7];
            $scope.filterData.billNumber = $scope.paramsCache[5] || null;
            $scope.filterData.client_name = $scope.paramsCache[2] || null;
            $scope.filterData.phone = $scope.paramsCache[4] || null;
        }
    });

    $scope.ifShow = false;
    $scope.text = "更多高级过滤..";
    $scope.toggleShow = function () {
        $scope.ifShow = !$scope.ifShow;
        $scope.text = $scope.text == "更多高级过滤.." ? "隐藏高级过滤.." : "更多高级过滤..";
    };
    $scope.resetSearch = function () {
        $scope.paramsCache = [];
        $scope.$broadcast('filter', "init");
    }
}]);