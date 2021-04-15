class Product < ApplicationRecord
    belongs_to :shop
    has_many :product_order_instances
    has_many :order_instances, through: :product_order_instance
end
