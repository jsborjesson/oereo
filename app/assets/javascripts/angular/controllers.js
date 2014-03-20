angular.module('oereoApp')

.controller('ListController', function ($scope, $location, $route, Restangular, resources) {


  $scope.resources = resources;

  $scope.query = $route.current.params;
  $scope.query.page = resources.meta.page;
  $scope.totalItems = resources.meta.total;

  console.log($scope.query.license_id);


  // Filtering
  Restangular.all('licenses').getList().then(function (licenses) {
    $scope.licenses = licenses;
    // TODO: set the select to the correct value
  });

  $scope.loadQuery = function(opts) {
    params = _.extend($scope.query, opts);
    $location.search(params);
    $route.reload();
  };

  $scope.delete = function (resource) {
    if (confirm('Really delete?')) {
      resource.remove().then(function () {
        $scope.resources = _.without($scope.resources, resource);
      });
    }
  };
})

.controller('EditController', function ($scope, $location, Restangular, resource) {

  // BUG: this doesn't get the resource correctly
  var original = resource;
  $scope.resource = Restangular.copy(resource);

  $scope.isClean = function () {
    return angular.equals(original, $scope.resource);
  };

  $scope.save = function () {
    $scope.resource.put().then(function () {
      $location.path('/');
    });
  };
})

.controller('CreateController', function ($scope, $location, Restangular) {

  $scope.resource = $scope.resource || {};
  $scope.resource.resource_category_id = 1;

  $scope.save = function() {

    // Add http://
    // TODO: support https, maybe just remove this...
    $scope.resource.url = 'http://' + $scope.resource.url;

    Restangular.all('resources').post($scope.resource).then(function (resource) {
      $location.path('/');
    });
  };
});
