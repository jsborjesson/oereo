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

    heroku run rake db:migrate

_Note that there are no production settings in `database.yml`, Heroku will set these up automatically._

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


## Documentation

The [documentation site](http://alcesleo.github.io/oereo)

The documentation is written in Markdown in the `docs/` folder.

That folder is used to generate a documentation site with [Mkdocs](http://www.mkdocs.org/)
and served by Github Pages. To update the docs simply update the content of the `docs/` folder
and publish the changes like this:

    # install mkdocs and ghp-import if it's not already installed
    pip install mkdocs ghp-import

    # build the documentation site
    mkdocs build

    # push it to the gh-pages branch
    ghp-import -p site
