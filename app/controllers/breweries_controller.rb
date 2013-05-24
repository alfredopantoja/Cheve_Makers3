class BreweriesController < ApplicationController
	before_filter :signed_in_user, only: [:create, :destroy]

	def new
		@user = current_user
		@brewery = @user.build_brewery
	end

	def create
		@user = current_user
		@brewery = @user.build_brewery(params[:brewery])
		if @brewery.save
			flash[:success] = "Brewery created!"
			redirect_to root_url
		else
			render new_brewery_url
		end			
	end
	
	def destroy
	end
end		
