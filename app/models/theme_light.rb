class ThemeLight < ApplicationRecord
    belongs_to :theme
    belongs_to :light
    has_one :rooms
    def set_up
        self.light.set_color(self.r, self.g, self.b)
    end
end
