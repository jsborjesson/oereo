# oereo

_The tasty OER management API_

A palindrome made by combining **OER** _(**O**pen **E**ducational **R**esource)_ and **oreo**.

## Testing

Make sure the db is prepared:

    # if not using sqlite, make sure the db exists
    bundle exec rake db:create:all

    # mirror the migrations in the testing database
    rake db:test:clone

To run the tests:

    bundle exec rspec

