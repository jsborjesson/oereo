angular.module('factories', [])
.factory('parsePaginationHeader', function () {
  return function (header) {
    // TODO: Break this out, maybe a service?
    // Turns a Link header with pagination into an object, parses things like this:
    // <http://localhost:3000/api/resources?page=2>; rel="next", <http://localhost:3000/api/resources?page=3>; rel="last"
    var links = {},
        matches,
        regex = /<(.+)>; rel="(.+)"/;

    if (typeof header !== 'string') {
      return links;
    }

    header.split(', ').forEach(function (link) {
      matches = link.match(regex);
      links[matches[2]] = matches[1];
    });
    return links;

  };
});
