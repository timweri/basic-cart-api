class AddProductsIdToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :productsID, :integer, array: true, default: []
  end
end
