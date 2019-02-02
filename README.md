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
### Product
- [Fetch products](#fetch-products)
- [Add a product to cart](#add-a-product-to-cart)

### Shopping Cart
- [Check the content of cart](#check-the-content-of-cart)
- [Edit Cart](#edit-cart)
- [Complete Cart](#complete-cart)

## Product
### Fetch Products
#### Queries
- Fetch multiple products: [all_products](#all_products)
- Fetch individual product: [product](#product-connection)

### Add A Product To Cart
#### Mutations

## Shopping Cart
### Check The Content Of Cart

## Query
- [all_products](#all_products)
- [product](#product-connection)
- [user_by_id](#user-by-id)
- [user_by_username](#user-by-username)

### all_products
```graphql
all_products(only_show_available: Boolean = false): [Product]
```
Fetch all products from the catalog. 

#### Return Value
Refers to [ProductType](#product-type) for the return type.

#### Parameters
`only_show_available: Boolean = false`<br>
Only show products that have positive inventory count.

### <a name="product-connection"/> product
```graphql
product(id: ID!): Product
```
Fetch the product with the given ID.

#### Return Value
Refers to [ProductType](#product-type) for the return type.

#### Parameters
`id: ID!`<br>
The ID of the required product.

### user_by_id
```graphql
user_by_id(id: ID!): User
```
Fetch the user with the given ID.

#### Return value
Refers to [UserType](#user-type) for the return value.

#### Parameters
`id: ID!`<br>
The ID of the required user.

### user_by_username
```graphql
user_by_username(username: String!): User
```
Fetch the user with the given username.

#### Return value
Refers to [UserType](#user-type) for the return value.

#### Parameters
`username: String!`<br>
The username of the required user.

## Mutation
- [add_to_cart](#add-to-cart)
- [complete_cart](#complete-cart)
- [edit_cart_item_quantity](#edit-cart-item-quantity)
- [empty_cart](#empty-cart)
- [remove_from_cart](#remove_from_cart)

### add_to_cart
```graphql
add_to_cart(
    product_id: ID!
    user_id: ID!
    quantity: Int! = 1
): Cart!
```
Add a product to a specified user's cart with a customizable quantity.

#### Return Value
Returns the updated cart with the new product. Refers to [CartType](#cart-type) for the return type.

#### Parameters
`product_id: ID!`<br>
The unique ID of the product to be added to the cart.

`user_id: ID!`<br>
The unique ID of the user whose cart we are modifying.

`quantity: Int! = 1`<br>
The quantity of the product to be added. Default value is `1`. The value has to be at least `1`. 

### complete_cart
```graphql
complete_cart(user_id: ID!): Cart!
```
Complete the shopping cart (place the order for the items in the cart). A cart can only be completed if for each cart item, the quantity is at most the inventory count of the product. The cart is emptied once the cart is completed.

#### Return Value
If the completion is successful, returns the updated cart with the new product. Refers to [CartType](#cart-type) for the return type.

If there is not enough stock for any product, returns a list of messages with the following format:
```
#{name} (Product ID: #{id}) does not have enough stock.
```

#### Parameters
`user_id: ID!`<br>
The unique id of the user who owns the cart to be completed.

### edit_cart_item_quantity
```graphql
edit_cart_item_quantity(
    product_id: ID!
    user_id: ID!
    quantity: Int!
): Cart!
```
Edit the quantity of a cart item in a user's cart. If the new quantity is `0` or less, the cart item is removed from the cart.

#### Return Value
Returns the updated cart with the edited cart item. Refers to [CartType](#cart-type) for the return type.

#### Parameters
`product_id: ID!`<br>
The unique ID of the product to be edited. Used to identify the cart item in the cart.

`user_id: ID!`<br>
The unique ID of the user who owns the cart. Used to identify which cart to edit.

`quantity: Int!`<br>
The new quantity to be assigned to the cart item. If `quantity <= 0`, the cart item is removed.

### empty_cart
```graphql
empty_cart(user_id: ID!): Cart!
```
Empty the cart by removing all the cart items in the cart.

#### Return Value
Returns the emptied cart. Refers to [CartType](#cart-type) for the return type.

#### Parameters
`user_id: ID!`<br>
The unique ID of the user whose cart is to be emptied.

### remove_from_cart
```graphql
remove_from_cart(
    product_id: ID!
    user_id: ID!
): Cart!
```
Remove from cart the specified product/cart item. Does nothing if the product is not found in the cart.

#### Return Value
Returns the cart after removing the specified product/cart item. Refers to [CartType](#cart-type) for the return type.

## Types
- [Product Type](#product-type)
- [Product Category Type](#product-category-type)
- [Cart Type](#cart-type)
- [Cart Item Type](#cart-item-type)
- [User Type](#user-type)

### Product Type
Represents a product.
#### Fields
`id: ID!`<br>
The unique ID of the product.

`inventory_count: Int!`<br>
The inventory count of the product.

`name: String!`<br>
The name of the product.

`price: Float!`<br>
The price of the product.

`product_category: ProductCategory`<br>
The category of the product. Refer to [ProductCategoryType](#product-category-type).

### Product Category Type
Represents a product category. Each object of [ProductType](#product-type) can only have one [ProductCategoryType](#product-category-type).

#### Fields
`id: ID!`<br>
The unique ID of the product category.

`name: String!`<br>
The name of the product category.

`products: [Product]`<br>
The list of all products of this category. Refer to [ProductType](#product-type) for the return type.

### Cart Type
Represents a shopping cart. Each object of [UserType](#user-type) can only have one [CartType](#cart-type). Each object of [CartType](#cart-type) can have multiple [CartItemType](#cart-item-type) objects.

#### Fields
`id: ID!`<br>
The unique ID of the cart.

`cart_items: [CartItem]`<br>
The list of all items in the cart. Refer to [CartItemType](#cart-item-type) for the return type.

`user: User`<br>
The user that owns this cart. Refer to [UserType](#user-type) for the return type.

### Cart Item Type
Represents an item in the cart. An object of [CartItemType](#cart-item-type) can only belong to one object of [CartType](#cart-type).  Each object of [CartType](#cart-type) can have multiple [CartItemType](#cart-item-type) objects.

#### Fields
`id: ID!`<br>
The unique ID of the cart item.

`product: Product`<br>
The product this cart item is referring to. Refer to [ProductType](#product-type) for the return type.

`quantity: Int!`<br>
The amount of `CartItem.product` in the cart. This eliminates the case where there are multiple [CartItemType](#cart-item-type) objects for the same [ProductType](#product-type) object.

### User Type
Represents a user in the shop. A [UserType](#user-type) object can only own one [CartType](#cart-type).

#### Fields
`id: ID!`<br>
The unique ID of the user.

`cart: Cart`<br>
The cart that belongs to the user. Refer to [CartType](#cart-type) for the return type.

`username: String!`<br>
The username of the user.

