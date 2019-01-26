class Resolvers::RemoveFromCart < GraphQL::Function
  argument :product_id, !types.ID
  argument :user_id, !types.ID

  type !Types::CartType

  def call(obj, args, ctx)
    user = User.find(args[:user_id])
    cart = user.cart
    if cart.cart_items.exists?(product_id: args[:product_id])
      cart.cart_items.delete(cart.cart_items.find_by! product_id: args[:product_id])
      cart.save
    end
    cart
  end
end
