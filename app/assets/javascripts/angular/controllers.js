// FIXME: register on app instead of global

function ListController($scope, Restangular) {

  $scope.resources = Restangular.all('resources').getList().$object;

  $scope.delete = function (resource) {
    if (confirm('Really delete?')) {
      resource.remove().then(function () {
        $scope.resources = _.without($scope.resources, resource);
      });
    }
  };
}

function EditController($scope, $location, Restangular, resource) {

  // BUG: this doesn't get the resource correctly
  var original = resource;
  $scope.resource = Restangular.copy(resource);

  $scope.isClean = function () {
    return angular.equals(original, $scope.resource);
  };

  // $scope.delete = function () {
  //   original.remove().then(function () {
  //     $location.path('/');
  //   });
  // };

  $scope.save = function () {
    $scope.resource.put().then(function () {
      $location.path('/');
    });
  };
}


function CreateController($scope, $location, Restangular) {

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
}
