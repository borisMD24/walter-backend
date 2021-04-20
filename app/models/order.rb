class Order < ApplicationRecord
  belongs_to :user
  has_many :order_instances
  has_many :products, through: :order_instances

  def format #to call inside the `render json:`
    {
      :order => refactor, 
      :price => computeTotalPrice
    }
  end 

  private

  def refactor  #sorts order's products in a hash that classifies them
                #by shop's name.
    products = self.products
    h = {}
    products.map do |product|
      shop_name = product.shop.name
      if !h.has_key?(shop_name)
        h[shop_name] = [product]
      else
        h[shop_name].push product
      end
    end
    return h
  end

  def computeTotalPrice #compute the total price of an order
    products = self.products
    totalprice = products.map(&:price).reduce(0, :+)
    return totalprice
  end

end
