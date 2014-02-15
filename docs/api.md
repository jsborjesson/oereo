# API

## Authorization

The API requires _both **token** and **http basic** authorization_.

Authorizing with HTTP basic as a user is requested when needed, the
application access token should be sent as a `X-AUTH-TOKEN` header.
