app.controller('homeCtrl', function ($scope, $http, $timeout) {
    $scope.authenticated = false;
    $scope.message = null;
    $scope.UserInfo = {};

    $http.get('/Admin/User/CheckAuthentication').success(function (res) {
        res == true ? $scope.authenticated=true : $scope.authenticated=false;
    });

    $scope.login = function () {
        $http.post('/Admin/User/Login', $scope.UserInfo).success(function (res) {
            if (res == true) {
                window.location.reload();
            } else {
                $scope.message = res;
            }
        })
    }
});