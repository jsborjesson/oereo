oereoApp.run(function (Restangular, parsePaginationHeader) {

  // CONFIGURE API

  Restangular.setBaseUrl('/api');
  Restangular.setDefaultHeaders({ 'X-AUTH-TOKEN': 'access_token' }); // FIXME: secure access token

  // Parse the response
  Restangular.addResponseInterceptor(function(data, operation, what, url, response) {
    var extracted;
    console.log('Received: ', data);

    if (operation === 'getList') {
      extracted = data[what];
      extracted.links = parsePaginationHeader(response.headers('Link'));
      extracted.meta = data.meta;
      console.log('Extracted list: ', extracted);
    }
    else if (operation === 'get') {
      extracted = data[what.slice(0, -1)]; // Remove the S
      console.log('Extracted object: ', extracted);
    }

    return extracted;
  });

  Restangular.addRequestInterceptor(function (data, operation, what, url) {
    if (data) {
      if (data.tags) {
        data.tags = data.tags.split(',');
      }
      console.log('Requested ' + url + ' with: ', data);
    }
    return data;
  });


  Restangular.setErrorInterceptor(function (error) {
    console.error('Request error: ', error);
    var message = 'Something went wrong';
    if (error.status == 403) {
      message = 'Not allowed';
    }
    alert(message);
  });

});
