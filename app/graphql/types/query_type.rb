Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root for this schema"

  field :user_by_id, Types::UserType do
    argument :id, !types.ID
    resolve -> (obj, args, ctx) {
      User.find(args[:id])
    }
  end

  field :user_by_username, Types::UserType do
    argument :username, !types.String
    resolve -> (obj, args, ctx) {
      User.find_by! username: args[:username]
    }
  end

  field :product, Types::ProductType do
    argument :id, !types.ID
    resolve -> (obj, args, ctx) {
      Product.find(args[:id])
    }
  end

  field :all_products, types[Types::ProductType] do
    argument :only_show_available, types.Boolean, default_value: false
    resolve -> (obj, args, ctx) {
      if args[:only_show_available]
        Product.where('inventory_count > ?', 0)
      else
        Product.all
      end
    }
  end
end
