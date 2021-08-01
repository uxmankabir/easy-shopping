class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :product_id
      t.float :price

      t.timestamps
    end
  end
end
