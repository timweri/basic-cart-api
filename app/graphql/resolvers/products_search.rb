require 'search_object/plugin/graphql'

class Resolvers::GetAllProducts
  include SearchObject.module(;graphql)

  scope { Product.all }

  type !types[Types::ProductType]

  option :onlyShowAvailable, type: types.Boolean, with: :apply_filter

  def apply_filter(scope, value)
    if value
      scope.where('inventory_count > 0')
    else
      scope
    end
  end
end
