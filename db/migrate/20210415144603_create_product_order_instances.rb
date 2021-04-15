class CreateProductOrderInstances < ActiveRecord::Migration[6.1]
  def change
    create_join_table :product_order_instances do |t|
      t.references :order_instances
      t.references :products
      t.timestamps
    end
  end
end
