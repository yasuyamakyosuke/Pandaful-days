class User::ShopCommentsController < ApplicationController

	def create
		shop = Shop.find(params[:shop_id])
		comment = ShopComment.new(shop_comment_params)
		comment.user_id = current_user.id
		comment.shop_id = shop.id
		comment.save
		redirect_to shop_path(shop)
	end

	def destroy
		ShopComment.find_by(id: params[:id], shop_id: params[:shop_id]).destroy
		redirect_to shop_path(params[:shop_id])
	end

	private
	def shop_comment_params
		params.require(:shop_comment).permit(:comment,:score)
	end



end


