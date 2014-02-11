# oereo

_The tasty OER management API_

A palindrome made by combining **OER** _(**O**pen **E**ducational **R**esource)_ and **oreo**.

## Installing

### Set up the database

Here is an invaluable screencast on [migrating to PostgreSQL](http://railscasts.com/episodes/342-migrating-to-postgresql)

    # install postgres
    brew install postgresql

    # initialize the database cluster
    initdb /usr/local/var/postgres

    # start the database server
    pg_ctl start -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log


Homebrew creates a user with your login name when installing
Postgresql, you might need to change `database.yml` to
reflect your settings.

    # let rails create the databases
    rake db:create:all

    # and apply the migrations
    rake db:migrate

**All done!**

To interact with the database, run `rails db`.

## Deploying

Using [Heroku](https://www.heroku.com/), run:

    git push heroku master

## Testing

Make sure the db is prepared:

    # make sure the db exists
    rake db:create:all

    # mirror the migrations in the testing database
    rake db:test:clone

To run the tests:

    bundle exec rspec

