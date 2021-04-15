class Order < ApplicationRecord
    has_many :order_instances
    belongs_to :user
end
