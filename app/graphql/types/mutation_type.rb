Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'
  description "The mutation root for this schema"

  field :purchaseProducts, function: Resolvers::PurchaseProducts.new
end
