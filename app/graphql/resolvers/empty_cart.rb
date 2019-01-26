class Resolvers::EmptyCart < GraphQL::Function
  argument :user_id, !types.ID

  type !Types::CartType

  def call(obj, args, ctx)
    user = User.find(args[:user_id])
    cart = user.cart
    cart.cart_items.delete_all
    cart.save
    cart
  end
end
