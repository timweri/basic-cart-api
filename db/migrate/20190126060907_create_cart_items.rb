class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.belongs_to :cart, index: true
      t.belongs_to :product, index:true
      t.integer :quantity
      
      t.timestamps
    end
  end
end
