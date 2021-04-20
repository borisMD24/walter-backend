class ShopController < ApplicationController
    before_action :authenticate_user!
    def create
        current_user.upgrade_to("manager")
        shop = Shop.create()
        current_user.attach_shop(shop: shop)
    end
end
