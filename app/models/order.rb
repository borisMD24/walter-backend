class Order < ApplicationRecord
  belongs_to :user
  has_many :order_instances
  has_many :products, through: :order_instances
end
