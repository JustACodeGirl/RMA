/**
 * Created by brad.zhou on 2016/3/1.
 */
app.controller('ComplaintsModalController', ['$scope', 'Sheet', 'WorkFlow', '$filter','Summary', 'Verify', function ($scope, Sheet, WorkFlow, $filter, summary, Verify) {
    //register
    var placeholder = {region_id:0, region_name: '请选择...'};
    $scope.now = new Date();
    $scope.counties = [];
    $scope.provinces = [];
    $scope.cities = [];
    $scope.provinces.push(placeholder);
    $scope.cities.push(placeholder);
    $scope.counties.push(placeholder);
    var getProvinces = function(parentId){
        summary.getRegion(parentId).then(function(response){
            $scope.provinces = response.data.data;
            $scope.provinces.push(placeholder);
            $scope.province = placeholder;
        });
    };
    $scope.getCities = function(parentId, key){
        summary.getRegion(parentId)
            .then(function(response){
                $scope.cities = response.data.data;
                $scope.cities.push(placeholder);
                if(key == null || key == undefined){
                    $scope.city = placeholder;
                }else{
                    $scope.city = getFromList($scope.cities, key);
                }
            });
    };
    $scope.getCounties = function(parentId, key){
        summary.getRegion(parentId)
            .then(function(response){
                $scope.counties = response.data.data;
                $scope.counties.push(placeholder);
                if(key == null || key == undefined){
                    $scope.county = placeholder;
                }else{
                    $scope.county = getFromList($scope.counties, key);
                }
            });
    };
    getProvinces(1);
    var validateAddress = function(province, city, county){
        if($scope.province.region_id == 0){
            jQuery(province)[0].setCustomValidity('请选择省。');
            return false;
        }else{
            jQuery(province)[0].setCustomValidity('');
        }
        if($scope.city.region_id == 0){
            jQuery(city)[0].setCustomValidity('请选择城市。');
            return false;
        }else{
            jQuery(city)[0].setCustomValidity('');
        }
        if($scope.county.region_id == 0){
            jQuery(county)[0].setCustomValidity('请选择县/区。');
            return false;
        }else{
            jQuery(county)[0].setCustomValidity('');
        }
        return true;
    }
    $scope.$on('register', function (event, data) {

        jQuery("#buyTime").datepicker();
        if (data.toString() === 'init') {
            $scope.registerData = {card_no: '', card_bank: $scope.bankNames[0]};
            $scope.registerData.reason = $scope.applyReasons[0];
            $scope.province = placeholder;
            $scope.city = placeholder;
            $scope.county = placeholder;
            $scope.selectApplyType = $scope.applyTypes[0];
            $scope.selectProductType = $scope.productTypes[0];
        }
    });

    $scope.registerBill = function (valid) {
        if (!valid) {
            return false;
        }
        if(!validateAddress('#province1', '#city1','#county1')){
            return false;
        }
        jQuery('#register').modal('hide');
        var params = {
            apply_type_id: $scope.selectApplyType.id,
            goods_type_id: $scope.selectProductType.id,
            buy_time: $filter('date')($scope.registerData.buy_time, 'yyyy-MM-dd'),
            apply_reason_id: $scope.registerData.reason.id,
            card_no: $scope.registerData.card_no,
            card_bank_id: $scope.registerData.card_bank.id,
            client_name: $scope.registerData.client_name,
            province_id: $scope.province.region_id,
            city_id: $scope.city.region_id,
            district_id: $scope.county.region_id,
            phone: $scope.registerData.phone,
            address: $scope.registerData.address,
            sku: $scope.registerData.sku,
            fault_description: $scope.registerData.fault_description,
            account_name: $scope.registerData.account_name,
            human_id: $scope.adminInfo.human_id
        };
        if($scope.selectApplyType.id != 1){
            params.card_no = '';
            params.card_bank_id = -1;
        }
        WorkFlow.register(params).success($scope.refreshItem);
    };
    var getFromList = function(list ,key) {
        var result;
        angular.forEach(list, function(value){
            if(value.region_id === key){
                result = value;
            }
        });
        return result;
    };
    //modify
    $scope.$on('modify', function (event, data) {
        jQuery("#buy_time").datepicker();
        var billId = $scope.selectTableItem.bill_id;
        if (data.toString() === 'init') {
            $scope.modifyData = {};
            Sheet.modify(billId).success(function (response) {
                $scope.modifyData = response.data;
                $scope.modifyData.selectApplyType = $scope.applyTypes[$scope.modifyData.apply_type_id - 1];
                $scope.province = getFromList($scope.provinces, $scope.modifyData.province_id);
                $scope.getCities($scope.modifyData.province_id, $scope.modifyData.city_id);
                $scope.getCounties($scope.modifyData.city_id, $scope.modifyData.district_id);
                $scope.modifyData.productType = $scope.productTypes[$scope.modifyData.goods_type_id - 1];
                $scope.modifyData.reason = $scope.applyReasons[$scope.modifyData.apply_reason_id - 1];
                $scope.modifyData.buy_time = $filter('date')($scope.modifyData.buy_time, 'yyyy-MM-dd');
                $scope.modifyData.card_bank = $scope.bankNames[$scope.modifyData.card_bank_id - 1];
            });
        }
    });

    $scope.updateBill = function (valid) {
        if (!valid) {
            return false;
        }
        if(!validateAddress('#province2', '#city2','#county2')){
            return false;
        }
        jQuery('#modify').modal('hide');
        var params = {
            bill_id: $scope.selectTableItem.bill_id,
            apply_type_id: $scope.modifyData.selectApplyType.id,
            goods_type_id: $scope.modifyData.productType.id,
            client_name: $scope.modifyData.client_name,
            account_name: $scope.modifyData.account_name,
            province_id: $scope.province.region_id,
            apply_reason_id: $scope.modifyData.reason.id,
            city_id: $scope.city.region_id,
            district_id: $scope.county.region_id,
            phone: $scope.modifyData.phone,
            buy_time: $filter('date')($scope.modifyData.buy_time, 'yyyy-MM-dd'),
            address: $scope.modifyData.address,
            sku: $scope.modifyData.sku,
            fault_description: $scope.modifyData.fault_description,
            human_id: $scope.adminInfo.human_id,
            card_no: $scope.modifyData.card_no,
            card_bank_id: $scope.modifyData.card_bank.id
        }
        Sheet.saveBill(params).success($scope.refreshItem);
    };

    //verify
    $scope.$on('verify', function (event, data) {
        jQuery("#buy_time").datepicker();
        var as_apply_Id = $scope.selectTableItem.id;
        if (data.toString() === 'init') {
            $scope.verifyData = {};
            Verify.getAppliedBill(as_apply_Id).success(function (response) {
                $scope.verifyData = response.data;
                console.log($scope.verifyData);
                $scope.verifyData.selectApplyType = $scope.applyTypes[$scope.verifyData.apply_type - 1];
                $scope.verifyData.productType = $scope.productTypes[$scope.verifyData.goods_id - 1];
                $scope.province = getFromList($scope.provinces, $scope.verifyData.province_id);
                $scope.getCities($scope.verifyData.province_id, $scope.verifyData.city_id);
                $scope.getCounties($scope.verifyData.city_id, $scope.verifyData.county_id);
                $scope.verifyData.reason = $scope.applyReasons[$scope.verifyData.apply_reason_id - 1];
                $scope.verifyData.buy_time = $filter('date')($scope.verifyData.goods_buy_time, 'yyyy-MM-dd');
                $scope.verifyData.sku = $scope.verifyData.goods_no,
                $scope.verifyData.card_bank = $scope.bankNames[$scope.verifyData.refund_way - 1];

            });
        }
    });

    $scope.verifyBill = function (resultId, valid) {

        if (!valid) {
            return false;
        }
        if(!validateAddress('#province3', '#city3','#county3')){
            return false;
        }
        jQuery('#verify').modal('hide');
        var params = {
            apply_type_id: $scope.verifyData.selectApplyType.id,
            goods_type_id: $scope.verifyData.productType.id,
            buy_time: $filter('date')($scope.verifyData.buy_time, 'yyyy-MM-dd'),
            apply_reason_id: $scope.verifyData.reason.id,
            card_no: $scope.verifyData.refund_account,
            card_bank_id: $scope.verifyData.card_bank.id,
            client_name: $scope.verifyData.user_name,
            province_id: $scope.province.region_id,
            city_id: $scope.city.region_id,
            district_id: $scope.county.region_id,
            phone: $scope.verifyData.user_contact,
            address: $scope.verifyData.address,
            sku: $scope.verifyData.sku,
            fault_desc: $scope.verifyData.apply_reason,
            account_name: $scope.verifyData.app_account,
            human_id: $scope.adminInfo.human_id,
            verify_result_id: resultId,
            as_apply_Id: $scope.selectTableItem.id,
            comment: $scope.verifyData.comment
        }
        Verify.verifyBill(params).success($scope.refreshItem);
    };


    //archive
    $scope.archiveBill = function () {
        jQuery('#archive').modal('hide');
        var params = {
            bill_id: $scope.selectTableItem.bill_id,
            act_id: $scope.selectTableItem.act_id,
            archive_human_id: $scope.adminInfo.human_id,
            archive_memo: $scope.archiveMemo
        }
        WorkFlow.saveArchive(params).success($scope.refreshItem);
    };

    //reopen
    $scope.reopenBill = function () {
        jQuery('#reopen').modal('hide');
        var params = {
            bill_id: $scope.selectTableItem.bill_id,
            act_id: $scope.selectTableItem.act_id,
            reopen_human_id: $scope.adminInfo.human_id,
            reopen_memo: $scope.reopenMemo
        }
        WorkFlow.saveReopen(params).success($scope.refreshItem);
    };

    //check
    $scope.$on('check', function (event, data) {
        var billId = $scope.selectTableItem.bill_id;
        if (data.toString() === 'init') {
            Sheet.check(billId).success(function (response) {
                var result = response.data;
                $scope.checkData = {
                    applyName: $scope.applyTypes[result.apply_type_id - 1],
                    customerName: result.client_name,
                    registerName: result.account_name,
                    customerPhone: result.phone,
                    productNo: result.sku,
                    checkedResult: $scope.checkResults[0],
                    productType: $scope.productTypes[result.goods_type_id - 1],
                    buyTime: $filter('date')(result.buy_time, 'yyyy-MM-dd'),
                    faultDesc: result.fault_description,
                    memo: ''
                };
            });
        }
    });

    $scope.qualityTest = function (valid) {
        if (!valid) {
            return false;
        }
        if ($scope.checkData.checkedResult.id == 0) {
            jQuery('#checkResult')[0].setCustomValidity('请填写检测结果。');
            return false;
        }
        jQuery('#check').modal('hide');
        var params = {
            bill_id: $scope.selectTableItem.bill_id,
            check_result_id: $scope.checkData.checkedResult.id,
            check_result_name: $scope.checkData.checkedResult.name,
            check_opinion: $scope.checkData.memo,
            check_human_id: $scope.adminInfo.human_id
        }
        Sheet.saveCheck(params).success($scope.refreshItem);
    };

    //cs_approve
    $scope.$on('cs_approve', function (event, data) {
        var billId = $scope.selectTableItem.bill_id;
        if (data.toString() === 'init') {
            Sheet.csApprove(billId).success(function (response) {
                var result = response.data;
                $scope.approveData = {
                    applyName: $scope.applyTypes[result.apply_type_id - 1],
                    customerName: result.client_name,
                    registerName: result.account_name,
                    customerPhone: result.phone,
                    productNo: result.sku,
                    productType: $scope.productTypes[result.goods_type_id - 1],
                    buyTime: $filter('date')(result.buy_time, 'yyyy-MM-dd'),
                    faultDesc: result.fault_description,
                    checkedResult: $scope.checkResults[result.check_result_id - 1],
                    inspectorOpinion: result.check_opinion,
                    managerOpinion: ''
                };
            });
        }
    });

    $scope.csPass = function (resultId, valid) {

        if(!valid){
            return false;
        }
        jQuery('#cs_approve').modal('hide');
        var params = {
            bill_id: $scope.selectTableItem.bill_id,
            act_id: $scope.selectTableItem.act_id,
            //cs_approve_human_id: humanId,
            cs_approve_opinion: $scope.approveData.managerOpinion,
            cs_approve_result_id: resultId
        };
        if(resultId === 1) {
            params.cs_approve_human_id = $scope.adminInfo.human_id
        }
        Sheet.saveCsApprove(params).success($scope.refreshItem);
    };

    //receive_goods
    $scope.$on('receive_goods', function (event, data) {

        jQuery("#recvTime").datetimepicker({
            minDate: new Date()
        });
        var billId = $scope.selectTableItem.bill_id;
        if (data.toString() === 'init') {
            Sheet.acceptGoods(billId).then(function (response) {
                var data = response.data.data;
                var applyType = $scope.applyTypes[data.apply_type_id - 1];
                var goodsType = $scope.productTypes[data.goods_type_id - 1];
                $scope.acceptGoodsData = {
                    applyType: applyType,
                    clientName: data.client_name,
                    telephone: data.phone,
                    productType: goodsType,
                    productNo: data.sku,
                    regName: data.account_name,
                    express: $scope.expressCompanys[0]
                };
            });
        }
    });

    $scope.saveRecvGoods = function (valid) {
        if (!valid) {
            return false;
        }
        if( $scope.acceptGoodsData.express.id == 0){
            jQuery('#express')[0].setCustomValidity('请选择快递公司！！');
            return false;
        }
        jQuery('#receive_goods').modal('hide');
        var params = {
            bill_id: $scope.selectTableItem.bill_id,
            receive_courier_no: $scope.acceptGoodsData.trackNo,
            receive_courier_company_id: $scope.acceptGoodsData.express.id,
            receive_human_id: $scope.adminInfo.human_id,
            receive_time: $filter('date')($scope.acceptGoodsData.recvDate, 'yyyy-MM-dd HH:mm:ss')
        };
        Sheet.saveAcceptGoods(params).then($scope.refreshItem);
    };
}])