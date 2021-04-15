class AddShopIdToUser < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.references :shop, default: nil
    end
  end
end
