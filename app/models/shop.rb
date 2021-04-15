class Shop < ApplicationRecord
    has_many :products
    has_many :order_instances
end
