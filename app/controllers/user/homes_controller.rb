class User::HomesController < ApplicationController

	def top
   	  visitor = Visitor.where(page: "home").take
   	  if visitor.nil?
   		 visitor = Visitor.create(page: "home")
   	end
   	impressionist(visitor)
	end

	def about
	end
end
