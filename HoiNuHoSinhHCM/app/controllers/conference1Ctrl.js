app.controller('conferenceCtrl', function ($scope, $http, $routeParams, $timeout) {
    $scope.state = false;
    $scope.editId = "";
    var Conference = {};

    $http.get('/Admin/Conference/GetList').success(function (res) {
        for (var i = 0; i < res.length; i++) {
            res[i].Date = ToJavaScriptDate(res[i].Date);
        }
        $scope.ConferenceList = res;
    });

    $scope.addState = function (bool) {
        $scope.state = bool;
    }

    $scope.add = function () {
        $http.post('/Admin/User/AddConference', $scope.Conference).success(function (res) {
            $scope.ConferenceList.push(res);
            $scope.$apply();
            $scope.saved = true;
            $timeout(function () { $scope.saved = false }, 2000);
        });
    };

    $scope.edit = function (inx) {
        $scope.indexEdit = inx;
        $scope.editId = $scope.ConferenceList[inx].Id;
        $scope.nameEdit = $scope.ConferenceList[inx].Name;
    }

    $scope.update = function () {
        $scope.nameEdit = document.getElementById('nameEdit').value;
        $http.post('/Admin/User/UpdateConference', { Id: $scope.editId, Name: $scope.nameEdit }).success(function () {
            $scope.ConferenceList[$scope.indexEdit].Name = $scope.nameEdit;
            $scope.editId = null;
            $scope.saved = true;
            $timeout(function () { $scope.saved = false }, 2000);
        });
    }

    $scope.delete = function (inx) {
        if (confirm("Bạn có muốn xóa loại tin này không?")) {
            var itemToDelete = $scope.ConferenceList[inx];
            $http.get('/Admin/User/DeleteConference/' + itemToDelete.Id).success(function () {
                $scope.ConferenceList.splice(inx, 1);
            });
        }
    }

    function ToJavaScriptDate(value) {
        var pattern = /Date\(([^)]+)\)/;
        var results = pattern.exec(value);
        var dt = new Date(parseFloat(results[1]));
        return dt.getDate() + '/' + (dt.getMonth() + 1) + "/" + dt.getFullYear() + ' ' + dt.getHours() + ':' + dt.getMinutes() + ':' + dt.getSeconds();
    }
});