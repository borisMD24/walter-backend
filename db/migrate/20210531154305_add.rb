class Add < ActiveRecord::Migration[6.1] #add state to room
  def change
    change_table :rooms do |t|
      t.boolean :state
    end
  end
end
