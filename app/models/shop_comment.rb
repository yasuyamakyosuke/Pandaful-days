class ShopComment < ApplicationRecord

	belongs_to :shop
	belongs_to :user

    def self.shop_score_average(shop_id)
        ShopComment.where(shop_id: shop_id).average(:score)
    end


end
