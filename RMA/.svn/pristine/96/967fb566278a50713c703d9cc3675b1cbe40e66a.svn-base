/**
 * Created by nina.zheng on 2016/3/4.
 */
app.factory('system', ['$http', function ($http) {
    return {
        getListPhases: function () {
            return $http({
                method: 'GET',
                url: serverUrl + "/list/phases",
            });
        },
        getListUnits: function () {
            return $http({
                method: 'GET',
                url: serverUrl + "/list/units",
            });
        },
        getRightLists: function (id) {
            return $http({
                method: 'GET',
                url: serverUrl + "/list/filterrights",
                params: {
                    id: id
                }

            });
        },
        getRoleshumans: function () {
            return $http({
                method: 'GET',
                url: serverUrl + "/roles/getroleshumans",
            });
        },
        addRole: function (params) {
            return $http({
                method: 'POST',
                url: serverUrl + "/roles/addrole",
                data: params,
            });
        },
        addHuman: function (params) {
            return $http({
                method: 'POST',
                url: serverUrl + "/roles/addhuman",
                data: params,
            });
        },
        deleteRole: function (roleId) {
            return $http({
                method: 'POST',
                url: serverUrl + "/roles/deleterole",
                params: {
                    roleId: roleId
                }
            });
        },
        deleteHuman: function (humanId) {
            return $http({
                method: 'POST',
                url: serverUrl + "/roles/deletehuman",
                params: {
                    humanId: humanId
                }
            });
        },
        updateHuman: function (params) {
            return $http({
                method: 'POST',
                url: serverUrl + "/roles/updatehuman",
                data: params,
            });
        },
        updateRole: function (params) {
            return $http({
                method: 'POST',
                url: serverUrl + "/roles/updaterole",
                data: params,
            });
        },
        changePassword: function (oldPassword, newPassword) {
            return $http({
                method: 'POST',
                url: serverUrl + "/user/change_password",
                params: {
                    oldPassword: oldPassword,
                    newPassword: newPassword
                },
            });
        },
        getpostage: function() {
            return $http({
                method:'POST',
                url:serverUrl + "/postage/getpostage",
                //url:"../resource/json/package.json"
            })
        },
        savepostage: function(params){
            return $http({
                method: 'POST',
                url:serverUrl + "/postage/savepostage",
                data:params
            })
        },
        getactdeftime: function() {
            return $http({
                method:'POST',
                url:serverUrl + "/time/getactdeftime",
            })
        },
        saveactdeftime: function(params){
            return $http({
                method: 'POST',
                url:serverUrl + "/time/saveactdeftime",
                params: params,
            })
        },
        getschedule: function() {
            return $http({
                method:'POST',
                url:serverUrl + "/time/getschedule",
            })
        },
        saveschedule: function(params){
            return $http({
                method: 'POST',
                url:serverUrl + "/time/saveschedule",
                params:params
            })
        },
        getfestival: function() {
            return $http({
                method:'POST',
                url:serverUrl + "/time/getfestival",
            })
        },
        deletefestival: function(data) {
            return $http({
                method:'POST',
                url:serverUrl + "/time/deletefestival",
                params:{
                    festival_id:data
                },
            })
        },
        savefestival: function(params){
            return $http({
                method: 'POST',
                url:serverUrl + "/time/savefestival",
                params:params
            })
        },
    };
}]);
