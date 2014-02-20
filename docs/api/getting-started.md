# Getting started

How to access the API.

## Try it out

You can access the API at <http://oereo.herokuapp.com/api/>, first you should
follow the [authorization instructions](#authorization).

I strongly recommend [Postman](https://chrome.google.com/webstore/detail/postman-rest-client/fdmmgilgnpjigdojojpjoooidkmcomcm?hl=en)
to play with the API. It supports sending all the needed headers and presents a
simple interface with nicely formatted responses.

When using Postman, sending form-data usually works fine, but if you're sending
JSON, you may need to manually set the `Content-Type` header like this:

    Content-Type: application/json

Here is an example `POST` using Postman.

![A postman request](../../img/postman-1.png)

It is currently hosted on a free [Heroku](https://www.heroku.com/) account,
that means it will be unloaded from memory after being inactive a while - the
first request may be very slow.

## Formats

The API supports both **JSON** and **XML**, however JSON is the standard format
and is recommended. To get the same result in XML simply append `.xml` to the
url.

## Authorization

The API requires _both **token** and **http basic** authorization_.

First you should [register a developer account](http://oereo.herokuapp.com/register_developer)
and get your **access_token**. Currently there is only internal support for
users so you can use the **test user account** for now.

    username: test
    password: password

In Postman, you can set the header automatically by entering the credentials in
the Basic Auth section, the application access token should be sent as an
`X-AUTH-TOKEN` header.

Headers sent for a fully authenticated request should look something like this:

    HTTP-AUTHORIZATION: Basic dGVzdDpwYXNzd29yZA==
    X-AUTH-TOKEN: fc0ba8c1538ba7f3c103f7bbbc2ba0f6

`HTTP-AUTHORIZATION` and `Authorization` mean exactly the same thing.

## Versioning

The API is still **very** unstable and `v1` of the API should be considered to
be experimental.

TODO: Choosing version - no point yet since there is only one.
