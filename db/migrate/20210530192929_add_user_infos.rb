class AddUserInfos < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.string :first_name
      t.integer :privilege_grade
    end
  end
end
