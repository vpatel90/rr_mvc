[![Code Climate](https://codeclimate.com/github/vpatel90/rr_mvc/badges/gpa.svg)](https://codeclimate.com/github/vpatel90/rr_mvc)

# Request / Response MVC!


* Run the server with `ruby bin/server.rb`
  * Please note: The server will need to be restarted every time you change your code.

* You can use the Postman app for any requests that are not `GET` requests.
* All `GET` requests can be displayed directly in the browser by navigating to the URL requested.
* In the assignment instructions, if the type of the request is not specified, it can be assumed to be `GET`.


## Sending a Request

### GET
* `http://localhost:3001/users` Returns all users
* `http://localhost:3001/users/1` Returns user with that ID
* `http://localhost:3001/users/9999999` Returns 404
* `http://localhost:3001/users?first_name=s` Returns username where first name starts with a given string, can also use this to search for last_names or age
* `http://localhost:3001/users?limit=10&offset=10` Returns users starting with ID (limit) 10 plus an additional (offset) 10 users

### DELETE
* `http://localhost:3001/users/1` Deletes user at given ID

### POST
* `http://localhost:3001/users` Adds a user with a given body `first_name: "Justin"` `last_name:"Herrick"` and `age:"99"`

### PUT
* `http://localhost:3000/users/1` Modifies a user with a given body `'age:"9999999`
