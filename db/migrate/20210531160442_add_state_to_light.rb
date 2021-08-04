class AddStateToLight < ActiveRecord::Migration[6.1]
  def change
    change_table :lights do |t|
      t.boolean :state
    end
  end
end
