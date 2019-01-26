class Product < ApplicationRecord
  has_many :carts, :through => :cartitems
  belongs_to :product_category
end
