# Basic Cart API
A simple Ruby on Rails and GraphQL API to manage shopping cart and products. The database used is sqlite3 for local testing.

## Features
- Cart lookup by User ID
- Product lookup by ID
- Fetch all products according to category with customizable filter to only show available products.
- Cart can be completed only when inventory_count of all products is at least 1.
- GraphiQL Test GUI.

## To Be Added
- Authentication

## Getting Started
Make sure you have Ruby and Rails installed. Instructions for various platforms can be found on [https://gorails.com/setup](https://gorails.com/setup).

In the command line, go to the root directory of the project and run
```sh
bundle install
```

Then, set up the database and run the tests with
```sh
rake db:migrate
rake test
```

Launch the server locally using
```sh
rails server -p 3000
```

The server is now accessible via `localhost:3000`. All endpoint handling all queries are routed to `localhost:3000/query`. The GraphiQL GUI to test queries are available at `localhost:3000/graphiql`.

# Documentation [Incomplete]
Here are a list of all the subresources of the API. Click on a link to read the API documentation for accessing each resource:
#### Product
- [Fetch products](#fetch-products)
- [Add a product to cart](#add-a-product-to-cart)

#### Shopping Cart
- [Check the content of cart](#check-the-content-of-cart)
- [Edit Cart](#edit-cart)
- [Complete Cart](#complete-cart)

## Product
### Fetch Products
#### Queries
- [all_products](#all_products)
- [product](#product-connection)
#### all_products
`all_products(only_show_available: Boolean = false): Product`<br>
> Fetch all products from the catalog.



#### <a name="product-connection"/> product

### Add A Product To Cart
#### Mutations
- [addProduct](#addproduct)

#### addProduct

## Shopping Cart
### Check The Content Of Cart
#### Queries
- [checkCart](#checkcart)

#### checkCart

### Edit Cart
#### Mutations
- [emptyCart](#emptyCart)
- [removeFromCart](#removefromcart)
- [editQuantity](#editquantity)

#### emptyCart
#### removeFromCart
#### editQuantity