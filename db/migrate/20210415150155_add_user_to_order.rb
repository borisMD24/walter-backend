class AddUserToOrder < ActiveRecord::Migration[6.1]
  def change
    change_table :orders do |t|
      t.references :user
    end
  end
end
