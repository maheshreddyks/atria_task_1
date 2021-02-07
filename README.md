# AtriaTask1

## Task Description

Create two Data Models: User with fields email, password, full_name, Age. Topics Of Interests: TopicName, Short Desc.

Prepopulate with values like sports, cars, Reading, Photography, etc.

Build APIs to perform Signup and Login.

Build APIs to allow the user to add topics of interest and to view already added ones.


## To Run and check the application.

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Postman Collection

  * https://www.getpostman.com/collections/228c046d713dd3edfd61
  
## API Endpoints & Documentation

  *  GET  /api/pre_populate_data -> To Prepoluate the sample topic data. 
  *  POST /api/signup  -> users can signup with basic details such as email,full_name,pwd and age.
  *  GET  /api/list_all_topics  -> users can fetch all topics are avialable to chosse interests.
  *  POST /api/add_topics  -> users can add topics based on the interests avialable.
  *  GET  /api/get_user_topics -> users can fetch all topics that are assigned to user.
  

