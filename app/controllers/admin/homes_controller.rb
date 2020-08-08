class Admin::HomesController < ApplicationController

   def top
     range = Date.today.beginning_of_day..Date.today.end_of_day
     @visitor = Visitor.where(created_at: range).take
   	# user 側に
   	# visitor = Visitor.where(page: "home").take
   	# if visitor.nil?
   	# 	visitor = Visitor.create(page: "home")
   	# end
   	# impressionist(visitor)
   	# @user = User.find(params[:id])
    # impressionist(@user, nil, :unique => [:session_hash])
   end
end
