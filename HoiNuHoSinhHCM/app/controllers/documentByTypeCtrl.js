app.controller('documentByTypeCtrl', function ($scope, $http, $routeParams, $timeout) {
    $scope.state = false;
    $scope.editId = "";
    $scope.document = {};

    function LoadListdocument() {
        $http.get('/Admin/User/DocumentByType/' + $routeParams.id).success(function (res) {
            for (var i = 0; i < res.length; i++) {
                res[i].CreatedDate = ToJavaScriptDate(res[i].CreatedDate);
            }
            $scope.documentList = res;
        });

        $http.get('/Admin/User/DocumentTypeById/' + $routeParams.id).success(function (res) {
            $scope.currentDocumentType = res;
        });
    }
   
    LoadListdocument();

    $scope.addState = function (bool) {
        $scope.state = bool;
    }

    $scope.add = function () {
        $scope.document.ConfigGroup = $routeParams.id;
        $http.post('/Admin/User/AddDocument', $scope.document).success(function (res) {
            res.CreatedDate = ToJavaScriptDate(res.CreatedDate);
            $scope.documentList.push(res);
            $scope.$apply();
            $scope.saved = true;
            $timeout(function () { $scope.saved = false }, 2000);
        });
    };

    $scope.edit = function (inx) {
        $scope.indexEdit = inx;
        $scope.editId = $scope.documentList[inx].Id;
        $scope.document = $scope.documentList[inx];
    }

    $scope.update = function () {
        $http.post('/Admin/User/UpdateDocument', $scope.document).success(function () {
            $scope.editId = null;
            $scope.saved = true;
            $timeout(function () { $scope.saved = false }, 2000);

            LoadListdocument();
        });
    }

    $scope.delete = function (inx) {
        if (confirm("Bạn có muốn xóa document này không?")) {
            var itemToDelete = $scope.documentList[inx];
            $http.get('/Admin/User/DeleteDocumentType/' + itemToDelete.Id).success(function () {
                $scope.documentList.splice(inx, 1);
            });
        }
    }

    $scope.setLinkDownload = function (fileUrl) {
        $scope.document.LinkDownload = fileUrl;
    }

    function ToJavaScriptDate(value) {
        var pattern = /Date\(([^)]+)\)/;
        var results = pattern.exec(value);
        var dt = new Date(parseFloat(results[1]));
        //alert(dt.getDate.length == 1 ? "0" + dt.getDate() : dt.getDate());
        return dt.getDate() + '/' + (dt.getMonth() + 1) + "/" + dt.getFullYear();
    }

    function ToJavaScriptDateEdit(value) {
        var pattern = /Date\(([^)]+)\)/;
        var results = pattern.exec(value);
        var dt = new Date(parseFloat(results[1]));
        return dt.getFullYear() + '-' + (dt.getMonth() + 1 + '-' + dt.getDate());
    }
});