// config
var app =
    angular.module('app')
        .config(
        ['$controllerProvider', '$compileProvider', '$filterProvider', '$provide',
            function ($controllerProvider, $compileProvider, $filterProvider, $provide) {
                app.controller = $controllerProvider.register;
                app.directive = $compileProvider.directive;
                app.filter = $filterProvider.register;
                app.factory = $provide.factory;
                app.service = $provide.service;
                app.constant = $provide.constant;
                app.value = $provide.value;
            }
        ])
        .config(['$httpProvider', function ($httpProvider) {
            $httpProvider.interceptors.push('responseRejector');
        }])
        .constant('JQ_CONFIG', {
            plot:[  'public/js/jquery/chart/flot/jquery.flot.min.js',
                    'public/js/jquery/chart/flot/jquery.flot.orderBars.js',
                    'public/js/jquery/chart/flot/jquery.flot.resize.js',
                    'public/js/jquery/chart/flot/jquery.flot.tooltip.min.js',
                    'public/js/jquery/chart/flot/jquery.flot.spline.js',
                    'public/js/jquery/chart/flot/jquery.flot.pie.min.js'
            ]
        })


