class Cart < ApplicationRecord
  serialize :productsid, Array
  has_many :products, :through => :cartitems
end
