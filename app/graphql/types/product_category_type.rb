Types::ProductCategoryType = GraphQL::ObjectType.define do
  name "ProductCategory"
    description "A product category"
    field :id, !types.ID
    field :name, !types.String
    field :products do
      type Types::ProductType
      resolve -> (pc, args, ctx) {
        pc.products
      }
    end
end
