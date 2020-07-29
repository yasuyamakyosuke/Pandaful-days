class User::ShopsController < ApplicationController

	def search
	end

	def index
		@shops = Shop.all
	    @shops = @shops.where("shop_name like ?", "%#{params[:name]}%") if params[:name].present?
		@shops = @shops.where(genre_id: params[:genre_id]) if params[:genre_id].present?
		@shops = @shops.where(station_id: params[:station_id]) if params[:station_id].present?
		if params[:sort_type] == 'shop_comment_count'
          @shops = Shop.find(@shops.includes(:shop_comments).group('shop_comments.shop_id').order('count(shop_comments.shop_id) desc').pluck(:id))
        elsif params[:sort_type] == 'shop_name'
              @shops = @shops.order('shop_name asc')
        elsif params[:sort_type] == 'average_score'
              @shops = @shops.order('average_score desc')
        end
        @shops= @shops.page(params[:page])



	end

	def show
		@shop = Shop.find(params[:id])
		@shop_comment = ShopComment.new
	end

end
