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

    # list all tags
    /api/tags

    # list all available licenses
    /api/licenses

    # list all users
    /api/users

    # list all available categories
    /api/resource_categories

## Creating/changing resorces

This is a complete `POST` with all possible keys set.

    POST /api/resources

    {
        "title": "Google",
        "url": "http://www.google.com",
        "description": "A search engine",
        "tags": [
            "searching",
            "googling"
        ],
        "license_id": 1, // MIT License
        "resource_category": "Site"
    }

|         Key         | Compulsory |                                                  Description                                                  |
| ------------------: | :--------: | :------------------------------------------------------------------------------------------------------------ |
|             `title` |  &#10004;  | Maximum 140 characters.                                                                                       |
|               `url` |  &#10004;  | Needs to be a fully valid URL, including `http://`                                                            |
|       `description` |            | Longer description of the resource.                                                                           |
|              `tags` |            | are sent as an array of strings, they will be converted to lowercase.                                         |
| `resource_category` |  &#10004;  | **must be an exact match** of a valid category, you can find all valid options at `/api/resource_categories`. |
|        `license_id` |            | License is currently set by its **id**, you need to check out the current options at `/api/licenses`.         |

**The owner will automatically be set to the authorized `User`.**

Changing a resource works the same way, but on a specific url

    PUT /api/resources/1

    {
        "title": "Google Search",
        "url": "http://www.google.com",
        "description": "A search engine",
        "tags": [
            "searching",
            "googling"
        ],
        "license_id": 1, // MIT License
        "resource_category": "Site"
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
