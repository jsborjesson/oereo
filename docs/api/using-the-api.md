# Using the API

How to use the API, shown with working examples

## Reading resources

A list of example URL:s

    # list resources
    /api/resources

    # list a specific page of resources
    /api/resources?page=2

    # resource with id 3
    /api/resources/3

    # resources tagged with 'ruby'
    /api/resources?tagged=ruby
    /api/tags/ruby

    # list all tags
    /api/tags

    # list all available licenses
    /api/licenses

    # list all users
    /api/users

    # list all available categories
    /api/resource_categories

## Creating/changing resorces

TODO: explain licenses

You can post resources and attatch tags to them in one request:

    POST /api/resources

    {
        "title": "Google",
        "url": "http://www.google.com",
        "description": "A search engine",
        "tags": [
            "searching",
            "googling"
        ],
        "resource_category": "Site"
    }

* The owner will automatically be set to the authorized `User`.
* The resource_category **must be an exact match** of a valid
`resource_category`, you can find all valid values at
`/api/resource_categories`.

Changing a resource works the same way, but on a specific url

    PUT /api/resources/1

    {
        "title": "Google Search",
        "url": "http://www.google.com",
        "description": "A search engine",
        "tags": [
            "searching",
            "googling"
        ]
    }

## Pagination

Pagination is done automatically, you can go to a specified page with requests
like this:

    /api/resources?page=3

Links to other pages are sent in a header that looks something like this:

    Link: <http://localhost:3000/api/resources?page=1>; rel="first", <http://localhost:3000/api/resources?page=2>; rel="prev"

You can set how many records you want with the `per_page` variable:

    # it defaults to 10
    /api/resources?page=3&per_page=5
