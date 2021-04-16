class Order < ApplicationRecord
    has_many :instances
    belongs_to :user
end
