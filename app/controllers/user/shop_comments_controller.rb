class User::ShopCommentsController < ApplicationController

    def create
        shop = Shop.find(params[:shop_id])
        shop.shop_comments.build(
            comment: shop_comment_params[:comment],
            score: shop_comment_params[:score],
            user_id: current_user.id
        )
        if shop.save!
            #ShopComent.averrage #shop_id を指定するように変更する
            shop.average_score = ShopComment.shop_score_average(shop.id)
            shop.save
            redirect_to shop_path(shop)
        end
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


