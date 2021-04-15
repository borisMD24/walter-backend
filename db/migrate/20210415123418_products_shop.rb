class ProductsShop < ActiveRecord::Migration[6.1]
  def change 
    change_table :products do |t|
      t.references :shop
      t.float :price
      t.integer :quantity
      t.string :description
    end
  end
end

###
#   PENSER A :
#   ajouter les tags (table de jointure)
#   ajouter active Storage
###