app.controller('ChangePassCtrl', function ($scope, $http, $timeout) {
    $scope.authenticated = false;
    $scope.message = null;
    $scope.UserInfo = {};

    $http.get('/Admin/User/CheckAuthentication').success(function (res) {
        res == true ? $scope.authenticated=true : $scope.authenticated=false;
    });

    $scope.change = function () {
        $http.post('/Admin/User/ChangePass', $scope.UserInfo).success(function (res) {
            if (res == true) {
                $scope.UserInfo = null;
                $scope.message = "Đổi mật khẩu thành công!";
            } else {
                $scope.message = res;
            }
        })
    }
});