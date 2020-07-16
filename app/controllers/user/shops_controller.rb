class User::ShopsController < ApplicationController

	def search
	end

	def index
		@shops = Shop.all
		@shops = @shops.where("name like ?", "%#{params[:shop_name]}%") if params[:shop_name]
		@shops = @shops.where(genre_id: params[:genre_id]) if params[:genre_id]
		@shops = @shops.where(station_id: params[:station_id]) if params[:station_id]
	end

	def show
		@shop = Shop.find(params[:id])
		@shop_comment = ShopComment.new
	end

end
