class AddOrderToOrderInstance < ActiveRecord::Migration[6.1]
  def change
    change_table :order_instances do |t|
      t.references :orders
    end
  end
end
