class Resolvers::CompleteCart < GraphQL::Function
  argument :user_id, !types.ID

  type !Types::CartType

  def call(obj, args, ctx)
    user = User.find(args[:user_id])
    cart = user.cart
    completeable = true
    cart.cart_items.each { |x|
      product = x.product
      if x.quantity > product.inventory_count
        completeable = false
        ctx.add_error(GraphQL::ExecutionError.new("#{product.name} (Product ID: #{product.id}) does not have enough stock."))
      end
    }
    if completeable
      cart.cart_items.each { |x|
        product = x.product
        product.inventory_count -= x.quantity
        product.save
      }
      cart.cart_items.delete_all
      cart.save
      cart
    else
      nil
    end
  end
end
