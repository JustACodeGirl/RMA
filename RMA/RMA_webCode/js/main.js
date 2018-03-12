'use strict';

angular.module('app')
  .controller('AppCtrl', ['$scope', '$window', '$document', '$state', 'Users', 'Frame', 'Sheet',
    function ($scope, $window, $document, $state, Users, Frame, Sheet) {

      var isIE = !!navigator.userAgent.match(/MSIE/i);
      isIE && angular.element($window.document.body).addClass('ie');
      isSmartDevice($window) && angular.element($window.document.body).addClass('smart');
      $scope.app = {};
      $scope.adminInfo = {};

      var targetHumanModalMap = {
        '客诉受理中心': {
          name: 'complaint',
          url: 'views/modals/modal_complaints.html'
        },
        '售后服务中心': {
          name: 'aftersale',
          url: 'views/modals/modal_aftersale.html'
        },
        '财务中心': {
          name: 'finance',
          url: 'views/modals/modal_finance.html'
        }
      };

      $scope.shortph = {id: 0, name: '请选择...'};
      $scope.applyTypes = [];
      $scope.repairTypes = [];
      $scope.productTypes = [];
      $scope.expressCompanys = [];
      $scope.checkResults = [];
      $scope.bankNames = [];
      $scope.applyReasons = [];
      $scope.phases = [];
      $scope.units = [];

      //$scope.initDictionary = function(dicName, holder){
      //  if(holder === null || holder === undefined || holder.length == 0){
      //    Sheet.getDictionary(dicName).then(function (response) {
      //      holder = response.data.data;
      //      holder.push($scope.shortph);
      //    });
      //  }
      //};
      var initMainScope = function () {
        Sheet.getDictionary('apply_type').then(function (response) {
          $scope.applyTypes = response.data.data;
          //$scope.applyTypes.push($scope.shortph);
        });
        Sheet.getDictionary('repair_mode').then(function (response) {
          $scope.repairTypes = response.data.data;
          //$scope.repairTypes.push($scope.shortph);
        });
        Sheet.getDictionary('goods_type').then(function (response) {
          $scope.productTypes = response.data.data;
          //$scope.productTypes.push($scope.shortph);
        });
        Sheet.getDictionary('courier_company').then(function (response) {
          $scope.expressCompanys = response.data.data;
          //$scope.expressCompanys.push($scope.shortph);
        });
        Sheet.getDictionary('check_result').then(function (response) {
          $scope.checkResults = response.data.data;
          //$scope.checkResults.push($scope.shortph);
        });
        Sheet.getDictionary('bank').then(function (response) {
          $scope.bankNames = response.data.data;
          //$scope.bankNames.push($scope.shortph);
        });
        Sheet.getDictionary('apply_reason').then(function (response) {
          $scope.applyReasons = response.data.data;
          //$scope.applyReasons.push($scope.shortph);
        });
        Sheet.getDictionary('act_def').then(function(response){
          $scope.phases = response.data.data;
          //$scope.phases.push($scope.shortph);
        });
        Sheet.getDictionary('unit').then(function (response) {
          $scope.units = response.data.data;
          //$scope.units.push($scope.shortph);
        });
      };

      $scope.billTableHeight = jQuery(window).height() - 220;
      jQuery(window).resize(function () {
        jQuery('#billTable').height(jQuery(window).height() - 220);
      });
      $scope.login = function (params, valid) {
        if (valid) {
          jQuery('#user')[0].setCustomValidity('');
          jQuery('#password')[0].setCustomValidity('');
          Users.login(params).success(function (response) {
            $scope.adminInfo = response.data;
            initMainScope();
            if ($scope.adminInfo.human_id == 1000) {
              dataTool.set('access_info', JSON.stringify($scope.adminInfo));
              initBarList();
              $state.go('app.systemSetModule');
            } else {
              if ($scope.adminInfo.unit_id == 1) {
                $scope.adminInfo.unit_name = '客诉受理部门'
              } else if ($scope.adminInfo.unit_id == 2) {
                $scope.adminInfo.unit_name = '售后服务部门'
              }else if ($scope.adminInfo.unit_id == 0) {
                $scope.adminInfo.unit_name = '系统管理员'
              } else if ($scope.adminInfo.unit_id == 3) {
                $scope.adminInfo.unit_name = '财务部门'
              }
              dataTool.set('access_info', JSON.stringify($scope.adminInfo));
              initBarList();
              $state.go('app.customer_manage');
            }
          });
        } else {
          if (jQuery('#user')[0].validity.valueMissing) {
            jQuery('#user')[0].setCustomValidity('请填写用户名');
          } else {
            jQuery('#user')[0].setCustomValidity('');
          }
          if (jQuery('#password')[0].validity.valueMissing) {
            jQuery('#password')[0].setCustomValidity('请填写密码');
          } else {
            jQuery('#password')[0].setCustomValidity('');
          }
        }
      };

      $scope.logout = function () {
        Users.logout().success(function (response) {
          dataTool.delete('access_info');
          $window.location.href = 'index.html';
        });
      };
      var navUrlMap = {
        "个人信息": "index.html#/app/modifyInfo",
        "个人设置": "index.html#/app/modifyInfo" ,
        "修改密码": "index.html#/app/password",
        "添加人员": "index.html#/app/systemSetModule",
        "受理平台": "index.html#/app/customer_manage",
        "咨询回复": "index.html#/app/consult",
        "业务设置": "index.html#/app/basicSetup",
        "案件统计": "index.html#/app/summary",
        "案件查询": "index.html#/app/summary",
        "工作量统计": "index.html#/app/summary",
        "案件数量统计": "index.html#/app/summary",
        "售后案件查询": "index.html#/app/summary",
        "超期案件统计": "index.html#/app/summary",
        "维修返工统计": "index.html#/app/summary",
        "退款金额统计": "index.html#/app/summary",
        "售后原因统计": "index.html#/app/summary",
        "客服工作量统计": "index.html#/app/summary",
        "质检工作量统计": "index.html#/app/summary",
        "维修工作量统计": "index.html#/app/summary"
      };
      $scope.selectNavInfo = function (menu) {
        $scope.selectedMenu = menu;
        $scope.$broadcast('navchange', 'change');
        if (navUrlMap[menu.display_name]) {
          $window.location.href = navUrlMap[menu.display_name];
        }
        if (menu.display_name == "案件统计" ||
            menu.display_name == "工作量统计") {
          $scope.selectedMenu = menu.subnav[0];
        }
      };

      $scope.beautifyTime = function (time) {
        var hours = Math.floor(time / 3600);
        var minutes = Math.floor((time - 3600 * hours) / 60);
        return hours + '小时' + minutes + '分';
      }
      var getSubnavs = function (navlist, parentId) {
        var subList = new Array();
        angular.forEach(navlist, function (item) {
          if (item.parent_id == parentId) {
            subList.push(item);
          }
        });
        return subList;
      };
      $scope.icon = {1:"glyphicon-th",2:"glyphicon-th",3:"glyphicon-th",4:"glyphicon-envelope",5:"glyphicon-search",
        6:"glyphicon-list",7:"glyphicon-stats",8:"glyphicon-user",9:"glyphicon-cog"};
      var constructNavbar = function (navlist) {
        var navList = new Array();
        angular.forEach(navlist, function (item) {
          if (item.parent_id == 0) {
            var nav = item;
            var subnav = getSubnavs(navlist, item.navbar_id);
            nav.subnav = subnav;
            var icon = $scope.icon[item.navbar_id];
            nav.icon = icon;
            navList.push(nav);
          }
        });
        return navList;
      };


      var initBarList = function () {
        Frame.getNavbarList($scope.adminInfo.human_id).success(function (response) {
          $scope.app.moduleName = response.data[0].module_name;
          $scope.targetHumanModal = targetHumanModalMap[$scope.app.moduleName];
          $scope.app.navList = constructNavbar(response.data);
          if($window.location.href.indexOf("/app/summary") > 0){
            for(var i = 0; i < $scope.app.navList.length; i++){
              var menu = $scope.app.navList[i];
              if(menu.navbar_name == 'stat_bill'){
                $scope.selectedMenu = menu.subnav[0];
              }
            }
          }
        });
      };
      var access_info = dataTool.get('access_info');
      if (access_info != null && access_info != '') {
        if(document.cookie.indexOf('access_token') < 0){
          dataTool.delete('access_info');
          $window.location.href = 'index.html';
        } else {
          $scope.adminInfo = JSON.parse(access_info);
          initBarList();
          initMainScope();
        }
      } else if ($window.location.href.indexOf('index.html') < 0) {
        $window.location.href = 'index.html';
      }
      $scope.isLogin = function () {
        $scope.adminInfo = JSON.parse(access_info);
        if( document.cookie.indexOf('access_token') == 0){
          $scope.adminInfo = JSON.parse(access_info);
          if($scope.adminInfo.human_id == 1000){
            $window.location.href = 'index.html#/app/modifyInfo';
          }
          else{
            $window.location.href = 'index.html#/app/customer_manage';
          }
        }
      }

      function isSmartDevice($window) {
        var ua = $window['navigator']['userAgent'] || $window['navigator']['js'] || $window['opera'];
        return (/iPhone|iPod|iPad|Silk|Android|BlackBerry|Opera Mini|IEMobile/).test(ua);
      }

    }]);

var dateFormat = function (date) {

  if (date instanceof Date) {
    return date.getFullYear() + '-'
      + (date.getMonth() + 1) + '-'
      + date.getDate();
  } else {
    return date;
  }
};