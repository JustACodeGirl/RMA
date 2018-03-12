app.controller('RMAController', ['$scope', 'Frame',
    function ($scope, Frame) {
        $scope.haveSelected = false;
        $scope.selectTabMenuId = 0;

        $scope.app.tabActionList = {};
        $scope.app.tableHeaderList = {};
        $scope.app.tableItemList = {};

        Frame.getTabMenu($scope.adminInfo.human_id).success(function (response) {
            $scope.app.tabMenuList = response.data;
            $scope.selectTabMenuId = $scope.app.tabMenuList[0].tasklist_id;
            getTabDetail();
        });

        var getTabDetail = function () {
            Frame.getTabAction($scope.adminInfo.human_id, $scope.selectTabMenuId).success(function (response) {
                $scope.app.tabActionList[$scope.selectTabMenuId] = response.data;
            });
            Frame.getTableHeader($scope.selectTabMenuId).success(function (response) {
                $scope.app.tableHeaderList[$scope.selectTabMenuId] = response.data;
            });
            $scope.refreshItem();
        };

        $scope.refreshItem = function () {
            Frame.getTableItem($scope.selectTabMenuId, $scope.adminInfo.human_id).success(function (response) {
                $scope.app.tableItemList[$scope.selectTabMenuId] = response.data;
                $scope.haveSelected = false;
                angular.forEach($scope.app.tableItemList[$scope.selectTabMenuId], function (tableItem) {
                    tableItem.selected = false;
                });
            });
        };

        $scope.changeTab = function (tabMenuId) {
            if (tabMenuId != $scope.selectTabMenuId) {
                $scope.selectTabMenuId = tabMenuId;
                var humanId = $scope.adminInfo.human_id;
                getTabDetail();
            }
        };

        $scope.changeSelection = function (tableItem) {
            var clickItemSelected = tableItem.selected;
            angular.forEach($scope.app.tableItemList[$scope.selectTabMenuId], function (item) {
                item.selected = false;
            });
            $scope.haveSelected = tableItem.selected = !clickItemSelected;
            $scope.selectTableItem = tableItem;
            $scope.canTransit = false;
        };

        $scope.viewBill = function(billId){
            $scope.$broadcast("viewbill", billId);
        };

        $scope.broadCastInitMsg = function (modalId) {
            $scope.$broadcast(modalId, "init");
        };

        $scope.isButtonShow = function (menuId) {
            if (menuId == 'register' || menuId == 'filter') {
                return true;
            } else if ($scope.haveSelected) {
                if(menuId == 'viewprocess' || menuId == 'verify'){
                    return true;
                }
                //if(menuId == 'reopen' && $scope.selectTableItem['act_state_id'] != 6){
                //    return false;
                //}
                return $scope.selectTableItem['human_id'] ? (menuId != 'receive_bill') : (menuId == 'receive_bill');
            } else {
                return false;
            }
        };
    }
]);