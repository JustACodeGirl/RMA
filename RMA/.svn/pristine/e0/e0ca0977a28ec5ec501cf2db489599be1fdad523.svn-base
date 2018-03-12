'use strict';

/**
 * Config for the router
 */
angular.module('app')
  .run(
  ['$rootScope', '$state', '$stateParams',
    function ($rootScope, $state, $stateParams) {
      $rootScope.$state = $state;
      $rootScope.$stateParams = $stateParams;
    }
  ]
)
  .config(
  ['$stateProvider', '$urlRouterProvider',
    function ($stateProvider, $urlRouterProvider) {

      $urlRouterProvider
        .otherwise('/access/login');
      $stateProvider
        .state('app', {
          abstract: true,
          url: '/app',
          templateUrl: 'views/app.html'
        })
        .state('access', {
          url: '/access',
          template: '<div ui-view></div>'
        })
        //signin
        .state('access.login', {
          url: '/login',
          templateUrl: 'login/login.html'
        })
        //admin entries
        .state('app.customer_manage', {
          url: '/customer_manage',
          templateUrl: 'views/app_main.html',
          resolve: {
            deps: ['$ocLazyLoad',
              function ($ocLazyLoad) {
                return $ocLazyLoad.load('js/controllers/rmaCtrl.js');
              }]
          }
        })
        .state('app.systemSetModule', {
          url: '/systemSetModule',
          templateUrl: 'views/app_systemSetModule.html',
          resolve: {
            deps: ['$ocLazyLoad',
              function ($ocLazyLoad) {
                return $ocLazyLoad.load('js/controllers/systemSetModule.js ');
              }]
          }
        })
        .state('app.basicSetup', {
          url: '/basicSetup',
          templateUrl: 'views/app_basicSetup.html',
          resolve: {
            deps: ['$ocLazyLoad',
              function ($ocLazyLoad) {
                return $ocLazyLoad.load(
                  'js/controllers/businessModule.js'
                ).then(
                  function(){
                    return $ocLazyLoad.load('ui.calendar');
                  }
                );
              }]
          }
        })
        .state('app.addperson', {
          url: '/addperson',
          templateUrl: 'views/app_addperson.html',
          resolve: {
            deps: ['$ocLazyLoad',
              function ($ocLazyLoad) {
                return $ocLazyLoad.load('js/controllers/rmaCtrl.js ');
              }]
          }
        })
        .state('app.modifyInfo', {
          url: '/modifyInfo',
          templateUrl: 'views/app_modifyInfo.html',
          resolve: {
            deps: ['$ocLazyLoad',
              function ($ocLazyLoad) {
                return $ocLazyLoad.load('js/controllers/rmaCtrl.js ');
              }]
          }
        })
        .state('app.password', {
          url: '/password',
          templateUrl: 'views/app_password.html',
          resolve: {
            deps: ['$ocLazyLoad',
              function ($ocLazyLoad) {
                return $ocLazyLoad.load('js/controllers/password.js');
              }]
          }
        })
        .state('app.summary', {
          url: '/summary',
          templateUrl: 'views/app_summary.html',
          resolve: {
            deps: ['$ocLazyLoad',
              function ($ocLazyLoad) {
                return $ocLazyLoad.load('js/controllers/summary.js');
              }]
          }
        })
        .state('app.consult', {
          url: '/consult',
          templateUrl: 'views/app_consult.html',
          resolve: {
            deps: ['$ocLazyLoad',
              function ($ocLazyLoad) {
                return $ocLazyLoad.load('js/controllers/consult.js');
              }]
          }
        })
    }
  ]
);