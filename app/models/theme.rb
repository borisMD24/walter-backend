class Theme < ApplicationRecord
    has_many :theme_lights
    def toggle
        self.theme_lights.map do |tl|
            tl.set_up
        end
    end
end
