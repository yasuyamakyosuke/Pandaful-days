class Admin::HomesController < ApplicationController

   def top
   	# user 側に
   	visitor = Visitor.where(page: "home").take
   	if visitor.nil?
   		visitor = Visitor.create(page: "home")
   	end
   	impressionist(visitor)
   	# @user = User.find(params[:id])
    # impressionist(@user, nil, :unique => [:session_hash])
   end
end
