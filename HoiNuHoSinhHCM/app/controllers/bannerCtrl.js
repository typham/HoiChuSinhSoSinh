app.controller('bannerCtrl', function ($scope, $http, $timeout) {
    $http.get('/Admin/Common/GetBanner').success(function (res) {
        $scope.banners = res.Image.split('|');
        $scope.copyBanner = res;
    });

    $scope.Delete = function (key) {
        $scope.banners.splice(key, 1);
        $scope.$apply();
    };

    $scope.addBanner = function (ImageUrl) {
        $scope.banners.push(ImageUrl);
        $scope.$apply();
    }

    $scope.save = function () {
        $scope.copyBanner.Image = $scope.banners.join('|')
        $http.post('/Admin/Common/Update', $scope.copyBanner).success(function () {
            $scope.saved = true;
            $timeout(function () { $scope.saved = false }, 1000);
        });
    }
});