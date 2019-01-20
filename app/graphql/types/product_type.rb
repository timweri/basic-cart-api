ProductType = GraphQL::ObjectType.define do
  name "Production"
    description "A Product"
    field :id, types.ID
    field :title, types.String
    field :price, types.Float
    field :inventory_count, types.Int
end
