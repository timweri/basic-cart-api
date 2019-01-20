QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root for this schema"

  field :allProducts, function: Resolvers::GetAllProducts
end
