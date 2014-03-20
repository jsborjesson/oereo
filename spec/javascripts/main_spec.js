
//= require angular
//= require angular-mocks

describe('modules', function () {

  describe('commatize', function () {
    beforeEach(module('filters'));

    it('splits an array out with commas', inject(function(commatizeFilter) {
      expect(commatizeFilter(['one', 'two', 'three'])).toBe('one, two, three');
    }));

  });

  describe('capitalize', function () {
    beforeEach(module('directives'));
    beforeEach(inject(function ($compile, $rootScope) {
      $scope = $rootScope;
      element = angular.element('<form name="form"><textarea capitalize ng-model="subject" name="subject"></textarea></form>');
      $compile(element)($scope);
      $scope.$digest();
    }));


    it('should capitalize the first letter', function () {
      $scope.form.subject.$setViewValue('capitalized');

      // It sets both the model and the view to the capitalized result
      expect($scope.subject).toBe('Capitalized');
      expect($scope.form.subject.$viewValue).toBe('Capitalized');
    });
  });


  describe('parsePaginationHeader', function () {
    beforeEach(module('factories'));

    it('parses the header into an object', inject(function (parsePaginationHeader) {
      var header = '<http://localhost:3000/api/resources?page=1>; rel="first", <http://localhost:3000/api/resources?page=2>; rel="prev"',
          result = { 'first': 'http://localhost:3000/api/resources?page=1', 'prev': 'http://localhost:3000/api/resources?page=2' };

      expect(parsePaginationHeader(header)).toEqual(result);
    }));

    it('returns an empty object on invalid input', inject(function (parsePaginationHeader) {
      expect(parsePaginationHeader('')).toEqual({});
      expect(parsePaginationHeader(null)).toEqual({});
      expect(parsePaginationHeader('Not a pagination header')).toEqual({});
      expect(parsePaginationHeader({ 'wrong': 'input' })).toEqual({});
    }));
  });

});
