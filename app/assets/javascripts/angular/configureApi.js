oereoApp.run(function (Restangular, parsePaginationHeader) {

  // CONFIGURE API

  Restangular.setBaseUrl('/api');
  Restangular.setDefaultHeaders({ 'X-AUTH-TOKEN': 'access_token' }); // FIXME: secure access token

  // Parse the response
  Restangular.addResponseInterceptor(function(data, operation, what, url, response) {
    console.log('Received: ', data);

    if (operation === 'getList') {
      data = data[what];
      data.pagination = parsePaginationHeader(response.headers('Link'));
      console.log('Extracted list: ', data);
    }
    else if (operation === 'get') {
      data = data[what.slice(0, -1)]; // Remove the S
      console.log('Extracted object: ', data);
    }

    return data;
  });

});
