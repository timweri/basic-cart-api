# Basic Cart API
A simple Ruby on Rails and GraphQL API to manage shopping cart and products. The database used is sqlite3 for local testing.

## Features
- Cart lookup by User ID
- Product lookup by ID
- Fetch all products according to category with customizable filter to only show available products.
- Cart can be completed only when inventory_count of all products is at least 1.
- GraphiQL Test GUI.

## How To Setup
Make sure you have Ruby and Rails installed. Instructions for various platforms can be found on [https://gorails.com/setup](https://gorails.com/setup).

In the command line, go to the root directory of the project and run
```sh
bundle install
```

Then, set up the database with
```sh
rake db:migrate
```

Launch the server locally using
```sh
rails server -p 3000
```

The server is now accessible via `localhost:3000`. All endpoint handling all queries are routed to `localhost:3000/query`. The GraphiQL GUI to test queries are available at `localhost:3000/graphiql`.

## Documentation
### Product Queries
#### 
