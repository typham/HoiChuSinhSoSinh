app.controller('documentCtrl', function ($scope, $http, $routeParams, $timeout) {
    $scope.state = false;
    $scope.editId = "";
    var DocumentType = {};

    $http.get('/Admin/User/DocumentType').success(function (res) {
        $scope.DocumentTypeList = res;
    });

    $scope.addState = function (bool) {
        $scope.state = bool;
    }

    $scope.add = function () {
        $http.post('/Admin/User/AddDocumentType', $scope.DocumentType).success(function (res) {
            $scope.DocumentTypeList.push(res);
            $scope.$apply();
            $scope.saved = true;
            $timeout(function () { $scope.saved = false }, 2000);
        });
    };

    $scope.edit = function (inx) {
        $scope.indexEdit = inx;
        $scope.editId = $scope.DocumentTypeList[inx].Id;
        $scope.nameEdit = $scope.DocumentTypeList[inx].Name;
    }

    $scope.update = function () {
        $scope.nameEdit = document.getElementById('nameEdit').value;
        $http.post('/Admin/User/UpdateDocumentType', { Id: $scope.editId, Name: $scope.nameEdit }).success(function () {
            $scope.DocumentTypeList[$scope.indexEdit].Name = $scope.nameEdit;
            $scope.editId = null;
            $scope.saved = true;
            $timeout(function () { $scope.saved = false }, 2000);
        });
    }

    $scope.delete = function (inx) {
        if (confirm("Bạn có muốn xóa loại tin này không?")) {
            var itemToDelete = $scope.DocumentTypeList[inx];
            $http.get('/Admin/User/DeleteDocumentType/' + itemToDelete.Id).success(function () {
                $scope.DocumentTypeList.splice(inx, 1);
            });
        }
    }
});