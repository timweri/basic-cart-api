class Resolvers::AddToCart < GraphQL::Function
  argument :product_id, !types.ID
  argument :user_id, !types.ID
  argument :quantity, !types.Int

  type !Types::CartType

  def call(obj, args, ctx)
    user = User.find(args[:user_id])
    cart = user.cart
    if cart.cart_items.exists?(product_id: args[:product_id])
      cart_item = cart.cart_items.find_by! product_id: args[:product_id]
      cart_item.quantity += args[:quantity]
      cart_item.save
    else
      cart_item = CartItem.create(product_id: args[:product_id], quantity: args[:quantity])
      cart.cart_items << cart_item
    end
    cart
  end
end
