
//= require angular
//= require angular-mocks

describe('filters', function() {

  beforeEach(module('filters'));

  describe('commatize', function () {

    it('splits an array out with commas', inject(function(commatizeFilter) {
      expect(commatizeFilter(['one', 'two', 'three'])).toBe('one, two, three');
    }));

  });

});
