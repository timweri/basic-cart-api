class Resolvers::PurchaseProducts < GraphQL::Function
  argument :ids, !types[types.ID]

  type !types[Types::ProductType]

  def call(obj, args, ctx)
    products = Product.find(args[:ids])
    products.each{|x|
      if x.inventory_count <= 0
          return GraphQL::ExecutionError.new("Purchase Error: Product #{x.title} is out of stock.")
      end
    }
    products.each{|x|
      x.inventory_count -= 1
      x.save
    }
  end
end
