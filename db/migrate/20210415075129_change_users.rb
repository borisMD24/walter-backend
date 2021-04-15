class ChangeUsers < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.integer :role, default: 0
      t.float :latitude
      t.float :longitude
      t.string :zip_code
      t.string :adress
      t.string :country
    end
  end
end
