class CreateThemeLights < ActiveRecord::Migration[6.1]
  def change
    create_table :theme_lights do |t|
      t.integer :r
      t.integer :g
      t.integer :b

      t.references :light
      t.references :room
      t.timestamps
    end
  end
end
