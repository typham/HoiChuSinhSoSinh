app.controller('conferenceCtrl', function ($scope, $http, $routeParams, $timeout) {
    $scope.state = false;
    $scope.editId = "";
    $scope.Conference = {};

    function LoadListConference() {
        $http.get('/Admin/Conference/GetList').success(function (res) {
            for (var i = 0; i < res.length; i++) {
                res[i].Date = ToJavaScriptDate(res[i].Date);
            }
            $scope.ConferenceList = res;
        });
    }
   
    LoadListConference();

    $scope.addState = function (bool) {
        $scope.state = bool;
    }

    $scope.add = function () {
        $http.post('/Admin/Conference/Add', $scope.Conference).success(function (res) {
            res.Date = ToJavaScriptDate(res.Date);
            $scope.ConferenceList.push(res);
            $scope.$apply();
            $scope.saved = true;
            $timeout(function () { $scope.saved = false }, 2000);
        });
    };

    $scope.edit = function (inx) {
        $scope.indexEdit = inx;
        $scope.editId = $scope.ConferenceList[inx].Id;
        $scope.Conference = $scope.ConferenceList[inx];
        $http.get('/Admin/Conference/ConferenceById/' + $scope.editId).success(function (res) {
            $scope.Conference.Date = new Date(ToJavaScriptDateEdit(res.Date));
        });
    }

    $scope.update = function () {
        $http.post('/Admin/Conference/Update', $scope.Conference).success(function () {
            $scope.ConferenceList[$scope.indexEdit].Name = $scope.nameEdit;
            $scope.editId = null;
            $scope.saved = true;
            $timeout(function () { $scope.saved = false }, 2000);

            LoadListConference();
        });
    }

    $scope.delete = function (inx) {
        if (confirm("Bạn có muốn xóa Conference này không?")) {
            var itemToDelete = $scope.ConferenceList[inx];
            $http.get('/Admin/Conference/Delete/' + itemToDelete.Id).success(function () {
                $scope.ConferenceList.splice(inx, 1);
            });
        }
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