Types::ProductType = GraphQL::ObjectType.define do
  name "Product"
    description "A Product"
    field :id, !types.ID
    field :name, !types.String
    field :price, !types.Float
    field :product_category do
      type Types::ProductCategoryType
      resolve -> (product, args, ctx) {
        product.product_category
      }
    end
    field :inventory_count, !types.Int
end
