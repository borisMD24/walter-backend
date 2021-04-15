class CreateOrderInstances < ActiveRecord::Migration[6.1]
  def change
    create_table :order_instances do |t|
      t.references :products
      t.references :order
      t.timestamps
    end
  end
end
