/**
 * Created by jinzhong.zheng on 2016/3/1.
 */
app.controller("AfterSaleController", ["$scope","Sheet","$filter","WorkFlow", function($scope, Sheet, $filter, WorkFlow){
    //repair
    $scope.$on('repair', function(event, data){
        var billId = $scope.selectTableItem.bill_id;
        $scope.canTransit = ($scope.selectTableItem.repair_human_id == null);
        if(data.toString() === 'init'){
            Sheet.repair(billId).then(function(response){
                var data = response.data.data;
                var productType = $scope.productTypes[data.goods_type_id - 1];
                $scope.repairData = {
                    clientName: data.client_name,
                    telephone: data.phone,
                    productNo: data.sku,
                    productType: productType,
                    cause: data.fault_description,
                    repairType: $scope.repairTypes[0]
                };
            });
        }
    });

    $scope.saveRepair = function(valid){
            if(!valid){
                return false;
            }
            if( $scope.repairData.repairType.id == 0){
                jQuery('#repairType')[0].setCustomValidity('请选择维修方式。');
                return false;
            }
            jQuery('#repair').modal('hide');
            var params = {
                bill_id: $scope.selectTableItem.bill_id,
            repair_human_id: $scope.adminInfo.human_id,
            repair_mode_id: $scope.repairData.repairType.id,
            repair_memo: $scope.repairData.repairmemo
        };
        Sheet.saveRepair(params).then(function(response){
            $scope.refreshItem();
        });

    }

    //exchange
    $scope.$on('exchange', function(event, data){

        var billId = $scope.selectTableItem.bill_id;
        if(data.toString() === 'init'){
            Sheet.exchange(billId).then(function(response){
                var data = response.data.data;
                $scope.exchangeData = {
                    clientName: data.client_name,
                    telephone: data.phone,
                    productType: $scope.productTypes[data.goods_type_id - 1],
                    address: data.address
                };
            });
        }
    });

    $scope.saveExchange = function(valid){

        if(!valid){
            return false;
        }
        if( $scope.exchangeData.productType.id == 0){
            jQuery('#exchangeProductType')[0].setCustomValidity('请选择更换商品类型。');
            return false;
        }
        jQuery('#exchange').modal('hide');
        var params = {
            bill_id: $scope.selectTableItem.bill_id,
            exchange_sku: $scope.exchangeData.productNo,
            exchange_human_id: $scope.adminInfo.human_id,
            exchange_memo: $scope.exchangeData.exchangememo,
            exchange_goods_type_id: $scope.exchangeData.productType.id
        };
        Sheet.saveExchange(params).then(function(response){
            $scope.refreshItem();
        });

    };

    //send
    $scope.$on('send', function(event, data){

        jQuery("#sendTime").datetimepicker({
            minDate: new Date()
        });
        var billId = $scope.selectTableItem.bill_id;
        if(data.toString() === 'init'){
            Sheet.sendGoods(billId).then(function(response){
                var data = response.data.data;
                var applyType = $scope.applyTypes[data.apply_type_id - 1];
                var goodsType = $scope.productTypes[data.goods_type_id - 1];
                $scope.sendGoodsData = {
                    applyType: applyType,
                    clientName: data.client_name,
                    telephone: data.phone,
                    productType: goodsType,
                    productNo: data.sku,
                    regName: data.account_name,
                    sender: $scope.adminInfo.human_name,
                    express: $scope.expressCompanys[0]
                };
            });
        }
    });

    $scope.saveSendGoods = function(valid){

        if(!valid){
            return false;
        }
        if( $scope.sendGoodsData.express.id == 0){
            jQuery('#sendExpress')[0].setCustomValidity('请选择快递公司。');
            return false;
        }
        jQuery('#send').modal('hide');
        var params = {
            bill_id: $scope.selectTableItem.bill_id,
            send_courier_no: $scope.sendGoodsData.trackNo,
            send_courier_company_id: $scope.sendGoodsData.express.id,
            send_human_id: $scope.adminInfo.human_id,
            send_time: $filter('date')($scope.sendGoodsData.sendDate, 'yyyy-MM-dd hh:mm:ss')
        };
        Sheet.saveSendGoods(params).then(function(response){
            $scope.refreshItem();
        });

    }

    //as_approve
    $scope.$on('as_approve', function(event, data){

        var billId = $scope.selectTableItem.bill_id;
        if(data.toString() === 'init'){
            Sheet.asApprove(billId).then(function(response){
                var data = response.data.data;
                var goodsType = $scope.productTypes[data.goods_type_id - 1];
                var exgoodsType = $scope.productTypes[data.exchange_goods_type_id - 1];
                var applyType = $scope.applyTypes[data.apply_type_id - 1];
                var repairType = $scope.repairTypes[data.repair_mode_id - 1];
                $scope.approveData = {
                    clientName: data.client_name,
                    telephone: data.phone,
                    productType: goodsType,
                    productNo: data.sku,
                    exproductNo: data.exchange_sku,
                    exproductType: exgoodsType,
                    approver: $scope.adminInfo.human_name,
                    applyType: applyType,
                    address: data.address,
                    repairType: repairType,
                    repairer: data.repair_human_name,
                    faultdesc: data.fault_description,
                    repairmemo: data.repair_memo,
                    exchanger: data.exchange_human_name,
                    exchangememo: data.exchange_memo
                };
            });
        }
    });

    $scope.saveAsApprove = function(resultId, valid){

        if(!valid){
            return false;
        }
        jQuery('#as_approve').modal('hide');
        var params = {
            as_approve_result_id: resultId,
            bill_id: $scope.selectTableItem.bill_id,
            //as_approve_human_id: humanId,
            as_approve_opinion: $scope.approveData.comment,
            act_id: $scope.selectTableItem.act_id
        };
        if(resultId === 1) {
            params.as_approve_human_id = $scope.adminInfo.human_id
        }
        Sheet.saveAsApprove(params).then(function(response){
            $scope.refreshItem();
        });

    }

}]);