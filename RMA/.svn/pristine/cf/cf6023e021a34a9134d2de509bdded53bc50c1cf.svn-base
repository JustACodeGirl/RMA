/**
 * Created by leo.liu on 2016/3/14.
 */
app.directive('inputValidCheck', function () {
    return {
        restrict: 'A',
        require: 'ngModel',
        link: function (scope, ele, attrs, c) {
            ele[0].setCustomValidity(attrs['inputValidCheck']);
        }
    }
});