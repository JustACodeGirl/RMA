angular.module('app').factory('responseRejector', ['$q', '$rootScope', '$window', function ($q, $rootScope, $window) {
  var responseRejector = {
    'requestError': function (rejection) {
      return $q.reject(rejection);
    },

    'response': function (response) {
      if (response.data.stateCode == undefined) {
        return response;
      }
      switch (response.data.stateCode) {
        case 'SUCCESS':
        case 'success':
        {
          break;
        }
        case 'UserNotLogin':
        case 'InvalidAccess':
        {
          $window.location.href = 'index.html';
          return $q.reject(response);
          break;
        }
        case 'InvalidAccessToken':
        {
          $window.location.href = 'index.html';
          dataTool.delete('access_info');
          toast('error', '', errorCodeMap[response.data.stateCode], null);
          return $q.reject(response);
          break;
        }
        default:
        {
          toast('error', '', errorCodeMap[response.data.stateCode], null);
          return $q.reject(response);
        }
      }
      return response;
    },

    'responseError': function (rejection) {
      return $q.reject(rejection);
    },
  };

  return responseRejector;
}]);