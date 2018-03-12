/**
 * Created by nina.zheng on 2016/3/20.
 */
app.controller('systemController', ['$scope', 'system', '$filter', '$window', '$state',
  function ($scope, system, $filter, $window, $state) {
    $scope.isShowUnit = true;
    $scope.rightIdList = new Array();
    system.getListPhases().success(function (response) {
      $scope.phaseLists = response.data;
      $scope.phaseItem = $scope.phaseLists[0];
      $scope.selectPhaseItem = $scope.phaseItem;
    });
    system.getListUnits().success(function (response) {
      $scope.unitLists = response.data;
      $scope.selectedUnit = $scope.unitList = $scope.unitLists[0];
    });
    $scope.isDisplay = true;
    $scope.isNotdisplay = true;
    var listAll = function () {
      system.getRoleshumans().success(function (response) {
        $scope.roleList = response.data;
        $scope.selectRole($scope.roleList[0]);
        if ($scope.roleList == []) {
          $scope.isDisplay = false;
        } else {
          $scope.isNotdisplay = false;
        }
      })
    };
    listAll();
    $scope.selectHuman = function (human) {
      $scope.human = human;
      if ($scope.human.unit_id == 1) {
        $scope.human.unit_name = '客诉受理部门'
      } else if ($scope.human.unit_id == 2) {
        $scope.human.unit_name = '售后服务部门'
      } else if ($scope.human.unit_id == 3) {
        $scope.human.unit_name = '财务部门'
      }
      $scope.selectedHumanId = human.human_id;
      angular.forEach($scope.roleList, function (roleInfo) {
        roleInfo.selected = false;
        angular.forEach(roleInfo.humans, function (human) {
          human.selected = false;
        })
      });
      human.selected = true;
      $scope.selectedType = "human";
    };

    $scope.selectRole = function (role) {
      var humanInfo = role.humans;
      angular.forEach(humanInfo, function (human) {
        if (human.unit_id == 1) {
          human.unit_name = '客诉受理部门'
        } else if (human.unit_id == 2) {
          human.unit_name = '售后服务部门'
        } else if (human.unit_id == 3) {
          human.unit_name = '财务部门'
        }
      });
      $scope.Role = role;
      $scope.Role.rights = role.rights;
      $scope.selectedRoleId = role.role_id;
      angular.forEach($scope.roleList, function (roleInfo) {
        roleInfo.selected = false;
        angular.forEach(roleInfo.humans, function (human) {
          human.selected = false;
        })
      });
      role.selected = true;
      $scope.disabled = true;
      $scope.selectedType = "role";
    };
    $scope.transmitRights = function (Role) {
      $scope.isUpdateRole = true;
    };
    $scope.transmitDate = function(Role) {
      $scope.humans = Role.humans;
      angular.forEach($scope.humans, function(human) {
        if(human.selected) {
          $scope.human = human;
        }
      })
    };
    $scope.changeActive = function(a,b) {
      angular.forEach(b, function(item){
        if(item == a) {
          item.selected = true;
          $scope.disabled = false;
        } else {
          item.selected = false;
        }
      });
    };
    $scope.showUpdatehuman = function(Role) {
      $scope.humans = Role.humans;
      angular.forEach($scope.humans, function(human) {
        if(human.selected) {
          $scope.human = human;
          $('#updatehuman').modal('show');
        }
      });
    };
    $scope.deleteModal = function () {
      system.deleteRole($scope.Role.role_id).success(function (response) {
        listAll();
      })
    };
    $scope.deleteModalUser = function(human) {
      $scope.human = human;
      system.deleteHuman($scope.human.human_id).success(function (response) {
        listAll();
      });
    };
    $scope.showDeleteModalUser = function(Role) {
      $scope.humans = Role.humans;
      angular.forEach($scope.humans, function(human) {
        if(human.selected) {
          $scope.human = human;
        }
      })
    };
    $scope.addhuman = function () {
      var params = {
        human_name: $scope.human_name,
        password: $scope.password,
        phone: $scope.phone,
        description: $scope.description,
        email: $scope.email,
        role_id: $scope.selectedRoleId,
        unit_id: $scope.unitList.unit_id
      };
      system.addHuman(params).success(function (response) {
        listAll();
        $scope.human_name = null;
        $scope.password = null;
        $scope.phone = null;
        $scope.description = null;
        $scope.email = null;
        $scope.selectedRoleId = null;
        $scope.unitList = null;
      })
    };
    $scope.modifyInfo = function (addperson) {
      system.modifyInfo(addperson).success(function (response) {
      })
    };
    $scope.rolesAddrole = function () {
      var params = {
        role_name: $scope.role_name,
        display_name: $scope.display_name,
        description: $scope.description,
        actProperty: {id: $scope.selectPhaseItem.id},
        rights: $scope.rightIdList
      };
      system.addRole(params).success(function (response) {
        listAll();
        $scope.role_name = null;
        $scope.display_name = null;
        $scope.description = null;
        $scope.phaseItem = null;
        $scope.rightLists = [];
        $scope.rightIdList = [];
        $scope.initPhaseItem(1);
      })
    };
    $scope.initPhaseItem = function(phaseItem){
      system.getRightLists(phaseItem).success(function (response) {
        $scope.rightLists = response.data;
      });
    };
    $scope.changePhaseItem = function (phaseItem) {
      console.log(phaseItem);
      $scope.isUpdateRole = true;
      $scope.selectPhaseItem = phaseItem;
      system.getRightLists(phaseItem.id).success(function (response) {
        $scope.rightLists = response.data;
        $scope.rightIdList = [];
      });
    };
    $scope.selectRight = function (checked, rightList) {
      if (checked == true) {
        $scope.rightIdList.push({navbar_id: rightList.navbar_id, granted: true});
      } else if (checked == false) {
        $scope.rightIdList.splice({navbar_id: rightList.navbar_id, granted: true}, 1);
      }
    };
    $scope.rightIdModifyList = new Array();
    $scope.changeSelectedUnit = function (selectedUnit) {
      console.log(selectedUnit);
      $scope.selectedUnit = selectedUnit;
    };

    $scope.UpdateRole = function ( ) {
      var params = {
        role_id: $scope.Role.role_id,
        role_name: $scope.Role.role_name,
        display_name: $scope.Role.display_name,
        description: $scope.Role.description,
        rights:  $scope.Role.rights
      };
      system.updateRole(params).success(function (response) {
        listAll();
        $scope.selectRole(params);
      })
    };
    $scope.modifyHuman = function (adminInfo) {
      var params = {
        human_id: adminInfo.human_id,
        human_name: $scope.adminInfo.human_name,
        phone: $scope.adminInfo.phone,
        description: $scope.adminInfo.description,
        email: $scope.adminInfo.email,
      }
      system.updateHuman(params).success(function (response) {
        dataTool.set('access_info', JSON.stringify($scope.adminInfo));
      });
    };
    $scope.updateHumanItem = function (phaseItem) {
      var params = {
        human_id: $scope.human.human_id,
        human_name: $scope.human.human_name,
        phone: $scope.human.phone,
        description: $scope.human.description,
        email: $scope.human.email,
      }
      system.updateHuman(params).success(function (response) {
        listAll();
        $scope.selectHuman(params)
      });
    };

  }]);

