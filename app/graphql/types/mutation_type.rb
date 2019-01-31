Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'
  description "The mutation root for this schema"

  field :add_to_cart, function: Resolvers::AddToCart.new
  field :remove_from_cart, function: Resolvers::RemoveFromCart.new
  field :edit_cart_item_quantity, function: Resolvers::EditCartItemQuantity.new
  field :empty_cart, function: Resolvers::EmptyCart.new
  field :complete_cart, function: Resolvers::CompleteCart.new
end
