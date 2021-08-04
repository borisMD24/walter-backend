class AddThemeToThemeLights < ActiveRecord::Migration[6.1]
  def change
    change_table :theme_lights do |t|
      t.references :theme
    end
  end
end
