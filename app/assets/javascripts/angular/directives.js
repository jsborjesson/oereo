angular.module('directives', [])

// TODO: capitalize words in new sentences
.directive('capitalize', function () {
  return {
    restrict: 'A',
    require: 'ngModel',
    link: function(scope, element, attrs, ngModel) {

      // http://stackoverflow.com/questions/15242592/angular-js-how-to-autocapitalize-an-input-field
      var capitalize = function(input) {
        var capitalized = input.charAt(0).toUpperCase() + input.substring(1);

        // Live update the view
        if(capitalized !== input) {
          ngModel.$setViewValue(capitalized);
          ngModel.$render();
        }
        return capitalized;
      };

      ngModel.$parsers.push(capitalize);
      capitalize(scope[attrs.ngModel]);  // capitalize initial value
    }
  };
});
