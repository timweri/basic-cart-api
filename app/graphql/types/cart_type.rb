Types::CartType = GraphQL::ObjectType.define do
  name "Cart"
    description "A Cart"
    field :id, !types.ID
    field :user do
      type Types::UserType
      resolve -> (cart, args, ctx) {
        cart.user
      }
    end
    field :cart_items do
      type types[Types::CartItemType]
      resolve -> (cart, args, ctx) {
        cart.cart_items
      }
    end
end
