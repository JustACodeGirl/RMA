'use strict';

app.controller('PasswordController', ['$scope', 'system', function ($scope, system) {
  $scope.stepShow = [true, false];
  $scope.changePassword = function (newPassword,invalid) {
    if (!invalid) {
      system.changePassword($scope.oldPassword, $scope.newPassword).then(function (response) {
        if (response.data.stateCode == 'SUCCESS') {
          $scope.stepShow = [false, true];
        }
      });
    } else{
      toast('error', '', "请输入密码", null);
    }
  };
  $scope.checkPasswdFormat = function (value) {
    if (value == 0) {
      if ($scope.confirmNewPassword != null) {
        $scope.form.confirmNewPassword.$error.dontmatch = ($scope.newPassword != $scope.confirmNewPassword);
      }
    } else {
      $scope.form.confirmNewPassword.$error.dontmatch = ($scope.newPassword != $scope.confirmNewPassword);
    }
  };
}]);