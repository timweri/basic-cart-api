ProductType = GraphQL::ObjectType.define do
  name "Product"
  description "A Product"
  
  field :id, types.Int
  field :title, types.String
  field :price, types.Float
  field :inventory_count, types.Int
end
