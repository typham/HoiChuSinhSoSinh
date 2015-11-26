app.controller('NewsCtrl', function ($scope, $http, $routeParams, $timeout) {
    $scope.state = {
        add: false,
        edit: false
    };

    $scope.News = {
        Id: 0,
        Name: '',
        Image: '',
        Summary: '',
        Content: '',
        CategoryId: 0
    }

    $http.get('/Admin/News/GetNewsByCategoryId/' + $routeParams.id).success(function (res) {
        for (var i = 0; i < res.length; i++) {
            res[i].CreatedDate = ToJavaScriptDate(res[i].CreatedDate);
        }
        $scope.NewsByCategory = res;
        $scope.News.CategoryId = $routeParams.id;
        $scope.NewsCategoryName = res[0].NewsCategoryName;
    });

    $scope.edit = function (idx) {
        $scope.NewsByCategory[idx];
        $scope.News = {
            Id: $scope.NewsByCategory[idx].Id,
            Name: $scope.NewsByCategory[idx].Name,
            Image: $scope.NewsByCategory[idx].Image,
            Summary: $scope.NewsByCategory[idx].Summary,
            Content: $scope.NewsByCategory[idx].Content,
            CategoryId: $scope.NewsByCategory[idx].CategoryId
        }
        $scope.state.edit = true;
    }

    $scope.save = function () {
        $http.post('/Admin/News/Save', $scope.News).success(function (res) {
            $scope.saved = true;
            $timeout(function () { $scope.saved = false }, 2000);
            $scope.resetState();
            $http.get('/Admin/News/GetNewsByCategoryId/' + $routeParams.id).success(function (res) {
                for (var i = 0; i < res.length; i++) {
                    res[i].CreatedDate = ToJavaScriptDate(res[i].CreatedDate);
                }
                $scope.NewsByCategory = res;
            });
        });
    }

    $scope.delete = function (idx) {
        if (confirm("Bạn có muốn xóa tin này không?")) {
            $http.get('/Admin/News/Delete/' + $scope.NewsByCategory[idx].Id).success(function (res) {
                $scope.NewsByCategory.splice(idx, 1);
            });
        }
    }

    $scope.resetState = function () {
        $scope.state = {
            add: false,
            edit: false
        };

        $scope.News = {
            Name: '',
            Image: '/Content/Images/no-image.jpg',
            Summary: '',
            Content: '',
            CategoryId: $routeParams.id
        }
    }

    function ToJavaScriptDate(value) {
        var pattern = /Date\(([^)]+)\)/;
        var results = pattern.exec(value);
        var dt = new Date(parseFloat(results[1]));
        return dt.getDate() + '/' + (dt.getMonth() + 1) + "/" + dt.getFullYear() + ' ' + dt.getHours() + ':' + dt.getMinutes() + ':' + dt.getSeconds();
    }
});