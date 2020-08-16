class User::ShopsController < ApplicationController

	def search
		@stations = Station.all
	end

	def index
		@shops = Shop.all
	  @shops = @shops.where("shop_name like ?", "%#{params[:name]}%") if params[:name].present?
		@shops = @shops.where(genre_id: params[:genre_id]) if params[:genre_id].present?
		@shops = @shops.where(station_id: params[:station_id]) if params[:station_id].present?
		@shops = if params[:sort_type] == 'shop_comment_count'
					      @shops.left_joins(:shop_comments)
						          .group('shops.id')
						          .order('count(shop_comments.shop_id) desc')
				                    # .select('shops.*', 'count(shop_comments.shop_id) AS shop_comment_count')
				                    #.group('shop_comments.shop_id')
 						 elsif params[:sort_type] == 'favorites_count'
 				        @shops.left_joins(:favorites)
 						 		      .group('favorites.shop_id')
 						 		      .order('count(favorites.shop_id) desc')
 				     elsif params[:sort_type] == 'shop_name'
 				       @shops.order('shop_name asc')
 				     elsif params[:sort_type] == 'average_score'
 				       @shops.order('average_score desc')
 				     end
    @shops= @shops.page(params[:page])
	end

	def show
		@shop = Shop.find(params[:id])
		@shop_comment = ShopComment.new
	end
end
