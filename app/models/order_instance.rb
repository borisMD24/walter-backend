class OrderInstance < ApplicationRecord
    belongs_to :order
    belongs_to :shop
    has_many :product_order_instance
    has_many :products, through: :product_order_instance
end
