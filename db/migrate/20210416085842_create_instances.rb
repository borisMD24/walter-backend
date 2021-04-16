class CreateInstances < ActiveRecord::Migration[6.1]
  def change
    create_table :instances do |t|
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
