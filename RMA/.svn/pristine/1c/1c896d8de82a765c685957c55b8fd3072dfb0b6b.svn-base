/**
 * Created by leo.liu on 2016/3/1.
 */
app.controller('FinanceModalController', ['$scope', 'Sheet', '$document', function ($scope, Sheet, $document) {
    $scope.$on('apply_pay', function (event, data) {
        if (data.toString() === 'init') {
            $scope.humanId = $scope.adminInfo.human_id;
            Sheet.applyPay($scope.selectTableItem.bill_id).success(function (response) {
                $scope.applyRequest = response.data;
                $scope.applyRequest.applyType = $scope.applyTypes[$scope.applyRequest.apply_type_id - 1];
                $scope.applyRequest.productType = $scope.productTypes[$scope.applyRequest.goods_type_id - 1];
                $scope.applyRequest.bankName = $scope.bankNames[$scope.applyRequest.card_bank_id - 1];
                $scope.applyRequest.fa_accounting_human_name = $scope.adminInfo.human_name;
            });
        }
    });

    $scope.processApply = function (applyRequest, valid) {
        if (valid) {
            jQuery('#apply_pay').modal('hide');
            var params = {
                bill_id: $scope.selectTableItem.bill_id,
                card_no: applyRequest.card_no,
                card_bank: applyRequest.card_bank,
                goods_price: applyRequest.productFee,
                postage: applyRequest.postage,
                total_cost: applyRequest.productFee + applyRequest.postage,
                accounting_human_id: $scope.humanId
            };
            Sheet.saveApplyPay(params).success($scope.refreshItem);
        }
    };

    $scope.$on('apply_pay_approve', function (event, data) {
        if (data.toString() === 'init') {
            $scope.humanId = $scope.adminInfo.human_id;
            Sheet.applyPayApprove($scope.selectTableItem.bill_id).success(function (response) {
                $scope.approveRequest = response.data;
                $scope.approveRequest.applyType = $scope.applyTypes[$scope.approveRequest.apply_type_id - 1];
                $scope.approveRequest.productType = $scope.productTypes[$scope.approveRequest.goods_type_id - 1];
                $scope.approveRequest.card_bank = $scope.bankNames[$scope.approveRequest.card_bank_id - 1];
                $scope.approveRequest.fa_approve_human_name = $scope.adminInfo.human_name;
            });
        }
    });

    $scope.processApprove = function (approveRequest, resultId, valid) {

        if(!valid){
            toast('error','', '«Î ‰»Î…Û∫À“‚º˚',null);
            return false;
        }
        jQuery('#apply_pay_approve').modal('hide');
        var params = {
            bill_id: $scope.selectTableItem.bill_id,
            act_id: $scope.selectTableItem.act_id,
            //fa_approve_human_id: humanId,
            fa_approve_opinion: approveRequest.fa_approve_opinion,
            fa_approve_result_id: resultId
        };
        if(resultId === 1) {
            params.fa_approve_human_id = $scope.adminInfo.human_id
        }
        Sheet.saveApplyPayApprove(params).success($scope.refreshItem);
    };

    $scope.$on('pay', function (event, data) {
        if (data.toString() === 'init') {
            $scope.humanId = $scope.adminInfo.human_id;
            Sheet.pay($scope.selectTableItem.bill_id).success(function (response) {
                $scope.payRequest = response.data;
                $scope.payRequest.applyType = $scope.applyTypes[$scope.payRequest.apply_type_id - 1];
                $scope.payRequest.productType = $scope.productTypes[$scope.payRequest.goods_type_id - 1];
                $scope.payRequest.card_bank = $scope.bankNames[$scope.payRequest.card_bank_id - 1];
                $scope.payRequest.cashier = $scope.adminInfo.human_name;
            });
        }
    });

    $scope.processPay = function (payRequest, valid) {
        if (valid) {
            jQuery('#pay').modal('hide');
            var params = {
                bill_id: $scope.selectTableItem.bill_id,
                cashier_human_id: $scope.adminInfo.human_id,
                real_pay: payRequest.real_pay,
                pay_no: payRequest.pay_no
            };
            Sheet.savePay(params).success($scope.refreshItem);
        }
    };
}])