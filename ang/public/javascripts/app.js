angular.module('app.servecices', [])
  .factory('appServe', ['$http', '$q', function ($http, $q) {
    var appServe = {};
    appServe.get = function() {
      var deferred = $q.defer();
      $http.get('/data').then(function (data) {
        deferred.resolve(data.data);

      });
      return deferred.promise;
    }
    appServe.t = function (f) {
      appServe.get().then(f);
    };
    return appServe;
  }])


angular.module('app.controllers', [])
    .controller('LoginCtrl', ['$scope', '$location', function ($scope, $location) {
      $scope.login = function () {

      };
      $scope.name= "John";
      $scope.pass= "Doe";
    }])
    .controller('AppCtrl', ['$scope', 'appServe', function ($scope, appServe) {
      appServe.t(function (data) {
        $scope.data = data.value;
      });
    }])
    .controller('RegCtrl', ['$scope', '$location', function ($scope, $location) {

    }])

angular.module('app', ['app.controllers', 'app.servecices', 'ngRoute']).config(['$routeProvider', function ($routeProvider) {
      $routeProvider
        .when('/login', {
          controller : 'LoginCtrl',
          templateUrl : '/view-login.html',
      })
      .when('/', {
          controller : 'AppCtrl',
          templateUrl : '/view-app.html',
      })
       .when('/register', {
          controller : 'RegCtrl',
          templateUrl : '/view-reg.html',
      })
      .otherwise({redirectTo : '/login'});
  }])
  .run(function ($location) {
     true ? $location.path('/') :  $location.path('/login');
});
