class Resolvers::EditCartItemQuantity < GraphQL::Function
  argument :product_id, !types.ID
  argument :user_id, !types.ID
  argument :quantity, !types.Int

  type !Types::CartType

  def call(obj, args, ctx)
    user = User.find(args[:user_id])
    cart = user.cart
    if cart.cart_items.exists?(product_id: args[:product_id])
      if args[:quantity] <= 0
        cart.cart_items.delete(cart.cart_items.find_by! product_id: args[:product_id])
        cart.save
      else
        cart_item = cart.cart_items.find_by! product_id: args[:product_id]
        cart_item.quantity = args[:quantity]
        cart_item.save
      end
    end
    cart
  end
end
