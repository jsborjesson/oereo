angular.module('filters', [])

.filter('commatize', function () {
  return function (input) {
    if (!_.isArray(input)) throw "Commatize only works with arrays";
    return input.join(', ');
  };
});
