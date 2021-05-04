class AddInfosToShop < ActiveRecord::Migration[6.1]
  def change
    change_table :shops do |t|
      t.float :latitude
      t.float :longitude
      t.string :zip_code
      t.string :adress
      t.string :country
    end
  end
end
