app.controller('ConsultController', ['$scope', '$state', 'FileUploader', 'Consult', function ($scope, $state, FileUploader, Consult) {
  Consult.list().success(function (response) {
    $scope.consultList = response.data;
    $scope.viewConsultDetail($scope.consultList[0]);
  });
  var getReplies = function () {
    $scope.attachs = [];
    $scope.newReply = {};
    $scope.consultReplies = [];
    Consult.replies($scope.selectConsult.id).success(function (response) {
      $scope.consultReplies = response.data;
    });
  };

  $scope.replyConsult = function (reply) {
    reply.consult_id = $scope.selectConsult.id;
    Consult.reply(reply).success(getReplies);
  };

  $scope.viewConsultDetail = function (consult) {
    $scope.selectConsult = consult;
    getReplies();
  }
}]);