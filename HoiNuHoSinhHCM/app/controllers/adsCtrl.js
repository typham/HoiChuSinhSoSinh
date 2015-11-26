app.controller('adsCtrl', function ($scope, $http, $timeout) {
    $http.get('/Admin/Common/GetAds').success(function (res) {
        $scope.ads = res.Image.split('|');
        $scope.copyBanner = res;
    });

    $scope.Delete = function (key) {
        $scope.ads.splice(key, 1);
        $scope.$apply();
    };

    $scope.addBanner = function (ImageUrl) {
        $scope.ads.push(ImageUrl);
        $scope.$apply();
    }

    $scope.save = function () {
        $scope.copyBanner.Image = $scope.ads.join('|')
        $http.post('/Admin/Common/Update', $scope.copyBanner).success(function () {
            $scope.saved = true;
            $timeout(function () { $scope.saved = false }, 1000);
        });
    }

    $scope.LinkAd = function (index) {
        var link = prompt("Nhập link của quảng cáo");
        if (link != null) {
            if ($scope.ads[index].lastIndexOf(';') != -1) {
                $scope.ads[index] = $scope.ads[index].substring(0, $scope.ads[index].lastIndexOf(';')) + ';' + link;
            } else {
                $scope.ads[index] = $scope.ads[index] + ';' + link;
            }
        }
    }
});

app.filter('split', function () {
        return function (input, splitChar, splitIndex) {
            // do some bounds checking here to ensure it has that index
            return input.split(splitChar)[splitIndex];
        }
    });