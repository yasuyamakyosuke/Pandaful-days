class Admin::ShopsController < ApplicationController

	def index
		@shops = Shop.all
	end

	def new
		@shop_new = Shop.new
	end

	def create
		@shop_new = Shop.new(shop_params)
		@shop_new.genre_id = params[:shop][:genre_id]
		@shop_new.station_id = params[:shop][:station_id]
		@shop_new.save
		redirect_to admin_shops_path
	end

	def show
		@shop = Shop.find(params[:id])
	end

	def edit
		@shop = Shop.find(params[:id])
	end

	def update
		@shop = Shop.find(params[:id])
		@shop.update(shop_params)
		redirect_to admin_shops_path(@shop)
	end

	private
	def shop_params
		params.require(:shop).permit(:shop_name,:shop_profile,:shop_address,:shop_time,:finish_time,:holiday,:shop_homepage,:main,:shop_quit,:genre_id,:station_id,shop_images_images: [])
	end
end
