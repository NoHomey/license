

angular.module('controllers', [])
  .controller('LoginCtrl', ['$scope', '$location', function ($scope, $location) {
    $scope.name= "John";
    $scope.pass= "Doe";
  }]);

angular.module('app', ['controllers', 'ngRoute'])
  .config(['$routeProvider', '$httpProvider', function ($httpProvider, $routeProvider) {
    $routeProvider.when('/', {
      controller : 'LoginCtrl',
      templateUrl : '/view-login.html'
      //reqLogin : false
    })
    /*.when('', {
      contorller : 'IndexCtrl',
      templateUrl : '/index.html',
      reqLogin : true
    })*/
    .otherwise({redirectTo : '/login'});
}]);
