class CreateLights < ActiveRecord::Migration[6.1]
  def change
    create_table :lights do |t|
      t.string :name
      t.boolean :custom
      t.references :room, null: false
      t.timestamps
    end
  end
end
