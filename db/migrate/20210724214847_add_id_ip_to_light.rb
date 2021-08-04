class AddIdIpToLight < ActiveRecord::Migration[6.1]
  def change
    change_table :lights do |t|
      t.integer :id_ip
    end
  end
end
