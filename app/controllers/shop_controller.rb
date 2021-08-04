class ShopController < ApplicationController
  respond_to :json
  before_action :authenticate_user!
  before_action :set_shop
  def create
      current_user.upgrade_to("manager")
      shop = Shop.create()
      current_user.bind_shop(shop)
      render json: shop
  end
  def update
    @shop.update(shop_params(params))
    render json: @shop
  end 

  private

  def shop_params(params)
    params.require(:shop)
          .permit(:name,
                    :latitude,
                    :longitude,
                    :zip_code,
                    :adress,
                    :country)
  end
  def set_shop
    @shop = current_user.shop
  end
end
