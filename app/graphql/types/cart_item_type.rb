Types::CartItemType = GraphQL::ObjectType.define do
  name "CartItem"
    description "A cart item"
    field :id, !types.ID
    field :product do
      type Types::ProductType
      resolve -> (cart_item, args, ctx) {
        cart_item.product
      }
    end
    field :quantity, !types.Int
end
