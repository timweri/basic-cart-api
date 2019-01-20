Types::CartType = GraphQL::ObjectType.define do
  name "Cart"
    description "A Cart"
    field :id, !types.ID
    field :products do
      type types[Types::ProductType]
      resolve -> (cart, args, ctx) {
        cart.products
      }
    end
end
