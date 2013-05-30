class BeersController < ApplicationController
	before_filter :signed_in_user, only: [:new, :edit, :update, :create, :destroy]
	before_filter :correct_user,   only: [:edit, :update, :destroy]
	
	def index
	end					
	
	def new
		@user = current_user
		@beer = @user.beers.new		
	end

	def create	
		@user = current_user			
		@beer = @user.beers.new(params[:beer])
		if @beer.save
			flash[:success] = "Beer created!"
			redirect_to current_user
		else			
			render action: "new" 
		end			
	end

	def edit
		@user = current_user					
	end

	def update
		@user = current_user			
		if @beer.update_attributes(params[:beer])
			flash[:success] = "Beer updated"
			redirect_to @user
		else
			render 'edit'
		end	
	end				

	def destroy
		@beer.destroy
		redirect_to current_user
	end				

	private
		
		def correct_user
			@beer = current_user.beers.find_by_id(params[:id])
			redirect_to root_url if @beer.nil?
		end			
end
