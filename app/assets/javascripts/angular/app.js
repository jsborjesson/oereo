var oereoApp = angular.module('oereoApp', ['restangular', 'ngRoute']);

oereoApp.config(function ($routeProvider, RestangularProvider) {

    $routeProvider.
        when('/', {
            controller: 'HomeController',
            templateUrl: 'test.html'
        }).
        otherwise({redirectTo: '/'});

    RestangularProvider.setBaseUrl('/api');
    RestangularProvider.setDefaultHeaders({ 'X-AUTH-TOKEN': 'access_token' }); // FIXME: secure access token

    // Parse the response
    RestangularProvider.setResponseExtractor(function(response, operation, what, url) {
      if (operation === "getList") {
        return response.resources; // FIXME: This will break VERY soon.
      }
      return response;
    });

});

function HomeController($scope, Restangular) {
    Restangular.all('resources').getList().then(function (resources) {
        $scope.resources = resources;
    });
}
