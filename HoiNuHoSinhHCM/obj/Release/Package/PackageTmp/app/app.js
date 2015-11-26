var app = angular.module('app', ['ngRoute','ngCkeditor','ui']);

app.config(function($routeProvider){
    $routeProvider.when('/', { templateUrl: '/app/views/index.html', controller: 'homeCtrl' })
                    .when('/banner', { templateUrl: '/app/views/banner.html', controller: 'bannerCtrl' })
                    .when('/ads', { templateUrl: '/app/views/ads.html', controller: 'adsCtrl' })
                    .when('/page', { templateUrl: '/app/views/page.html', controller: 'pageCtrl' })
					.when('/page/:id', { templateUrl: '/app/views/PageEdit.html', controller: 'pageCtrl' })
                    .when('/NewsCategory', { templateUrl: '/app/views/NewsCategory.html', controller: 'NewsCategoryCtrl' })
                    .when('/NewsByCategory/:id', { templateUrl: '/app/views/NewsByCategory.html', controller: 'NewsCtrl' })
                    .when('/document', { templateUrl: '/app/views/document.html', controller: 'documentCtrl' })
                    .when('/conference', { templateUrl: '/app/views/conference.html', controller: 'conferenceCtrl' })
                    .when('/DocumentByType/:id', { templateUrl: '/app/views/documentByType.html', controller: 'documentByTypeCtrl' })
                    .when('/Feedback', { templateUrl: '/app/views/feedback.html', controller: 'feedbackCtrl' })
                    .when('/ChangePass', { templateUrl: '/app/views/ChangePass.html', controller: 'ChangePassCtrl' })
					.otherwise({redirectTo:'/#/'});
});

