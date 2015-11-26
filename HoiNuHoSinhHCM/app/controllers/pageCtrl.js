app.controller('pageCtrl', function ($scope, $http, $routeParams, $timeout) {

    var Page = {};

    $http.get('/Admin/Page/List').success(function (res) {
        $scope.pageList = res;
    });

    $http.get('/Admin/Page/GetData/' + $routeParams.id).success(function (res) {
        $scope.pageName = res.Name;
        $scope.pageId = res.Id;
        $scope.content = res.Content;
    });

    $scope.save = function () {
        var page = {
            Id: $scope.pageId,
            Content: $scope.content
        };

        $http.post('/Admin/Page/Update', page).success(function (res) {
            $scope.saved = true;
            $timeout(function () { $scope.saved = false }, 2000);
        });
    }

    $scope.addState = function (bool) {
        $scope.state = bool;
    }

    $scope.add = function () {
        $http.post('/Admin/Page/Add', $scope.Page).success(function (res) {
            $scope.pageList.push(res);
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
        if (confirm("Bạn có muốn xóa trang này không?")) {
            var itemToDelete = $scope.pageList[inx];
            $http.get('/Admin/NewsCategory/Delete/' + itemToDelete.Id).success(function () {
                $scope.pageList.splice(inx, 1);
            });
        }
    }
});