class AddCurrentColorToLight < ActiveRecord::Migration[6.1]
  def change
    change_table :lights do |t|
      t.integer :r
      t.integer :g
      t.integer :b
    end
  end
end
