class Order < ApplicationRecord
  belongs_to :user
  has_many :order_instances
  has_many :products, through: :order_instances


  def refactor  #sorts order's products in a hash that classifies them
                #by shop's name.
    products = self.products
    h = {}
    products.map do |product|
      shop_name = product.shop.name
      if !h.has_value?(shop_name)
        h[shop_name] = [product]
      else
        h[shop_name].push product
      end
    end
    return h
  end

  def render #to call inside the `render json:`
    refactor
  end 
end
