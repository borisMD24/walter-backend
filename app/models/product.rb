class Product < ApplicationRecord
    belongs_to :shop
    has_many :order_instances
    has_many :orders, through: :order_instances
end
