# oereo [![Build Status](https://travis-ci.org/alcesleo/oereo.png?branch=master)](https://travis-ci.org/alcesleo/oereo)

**An OER management API, very new and unstable.**

The name is a palindrome made by combining **OER** _(**O**pen **E**ducational **R**esource)_
and **oreo**.

It is [documented](http://alcesleo.github.io/oereo) and [running](http://oereo.herokuapp.com/)
on Heroku.

## Installing

### Set up the database

Here is an invaluable screencast on [migrating to PostgreSQL](http://railscasts.com/episodes/342-migrating-to-postgresql)

    # install postgres
    brew install postgresql

    # initialize the database cluster
    initdb /usr/local/var/postgres

    # start the database server
    # this is the only one you need to run again if you restart your computer
    pg_ctl start -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log

    # create the postgres user
    createuser -s -r postgres

    # let rails create the databases
    rake db:create:all

    # and apply the migrations
    rake db:migrate

**All done!**

To interact with the database, run `rails db`.

## Developing

The `seeds.rb` contains some simple to remember and valid credentials that you can use in development:

#### ApiKey

* access_token: `access_token`

#### User

* username: `test`
* email: `test@email.com`
* password: `password`

#### Developer

* email: `dev@email.com`
* password: `password`


## Deploying

Using [Heroku](https://www.heroku.com/), run:

    git push heroku master

    heroku run rake db:migrate

_Note that there are no production settings in `database.yml`, Heroku will set these up automatically._

### Administrating

There is an admin interface at `/admin`.

If resetting the database or deploying for the first time it will have one
single superuser:

    admin@example.com
    password

**Don't forget to delete this and create a proper superuser.***

## Testing

Make sure the db is prepared:

    # make sure the db exists
    rake db:create:all

    # mirror the migrations in the testing database
    rake db:test:clone

To run the tests:

    bundle exec rspec

To run the tests automatically on filesave:

    guard

There are a few helpers in `spec/support` that you need to check out to
understand the tests.


## Documentation

**Never change the `gh-pages` branch by hand.**

The [documentation](http://alcesleo.github.io/oereo) is written in Markdown in the `docs/` folder.

That folder is used to generate a documentation site with [MkDocs](http://www.mkdocs.org/)
and served by Github Pages. To update the docs simply update the content of the `docs/` folder
and publish the changes like this:

    # install mkdocs and ghp-import if they're not already installed
    pip install mkdocs ghp-import

    # while working you can serve the documentation site dynamically with
    mkdocs serve

    # build the documentation site
    mkdocs build

    # push it to the gh-pages branch
    ghp-import -p site
