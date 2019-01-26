Types::UserType = GraphQL::ObjectType.define do
  name "User"
    description "A user"
    field :id, !types.ID
    field :username, !types.String
    field :cart do
      type Types::CartType
      resolve -> (user, args, ctx) {
        user.cart
      }
    end
end
