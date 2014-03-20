angular.module('oereoApp')

.controller('ListController', function ($scope, $location, $route, Restangular, resources) {

  $scope.resources = resources;

  $scope.query = $route.current.params;
  $scope.meta = resources.meta;

  // Filtering

  Restangular.all('licenses').getList().then(function (licenses) {
    $scope.licenses = licenses;

    // FIXME: So ugly...
    // Makes an array indexed by license-keys so you can say licensesById[license_id]
    $scope.licensesById = (function () {
      var licensesById = [];
      _.each(licenses, function (license) {
        licensesById[license.id] = license;
      });
      return licensesById;
    }());
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
  // TODO: DRY
  $scope.licenses = Restangular.all('licenses').getList().$object;

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
  // TODO: DRY
  $scope.licenses = Restangular.all('licenses').getList().$object;

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
