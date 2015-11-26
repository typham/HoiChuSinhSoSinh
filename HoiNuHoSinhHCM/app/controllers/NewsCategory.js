app.controller('NewsCategoryCtrl', function ($scope, $http, $routeParams, $timeout) {
    $scope.state = false;
    $scope.editId = "";
    var NewsCategory = {};

    $http.get('/Admin/NewsCategory/GetList').success(function (res) {
        $scope.NewsCategoryList = res;
    });

    $scope.addState = function (bool) {
        $scope.state = bool;
    }

    $scope.add = function () {
        $http.post('/Admin/NewsCategory/Add', $scope.NewsCategory).success(function (res) {
            $scope.NewsCategoryList.push(res);
            $scope.$apply();
            $scope.saved = true;
            $timeout(function () { $scope.saved = false }, 2000);
        });
    };

    $scope.edit = function (inx) {
        $scope.indexEdit = inx;
        $scope.editId = $scope.NewsCategoryList[inx].Id;
        $scope.nameEdit = $scope.NewsCategoryList[inx].Name;
    }

    $scope.update = function () {
        $scope.nameEdit = document.getElementById('nameEdit').value;
        $http.post('/Admin/NewsCategory/Update', { Id: $scope.editId, Name: $scope.nameEdit }).success(function () {
            $scope.NewsCategoryList[$scope.indexEdit].Name = $scope.nameEdit;
            $scope.editId = null;
            $scope.saved = true;
            $timeout(function () { $scope.saved = false }, 2000);
        });
    }

    $scope.delete = function (inx) {
        if (confirm("Bạn có muốn xóa loại tin này không?")) {
            var itemToDelete = $scope.NewsCategoryList[inx];
            $http.get('/Admin/NewsCategory/Delete/' + itemToDelete.Id).success(function () {
                $scope.NewsCategoryList.splice(inx, 1);
            });
        }
    }
});