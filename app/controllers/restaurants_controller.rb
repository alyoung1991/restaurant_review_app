class RestaurantsController < ApplicationController
	def index
		@restaurants = Restaurant.all
	end

	def new
		@restaurant = Restaurant.new
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def create
		if Restaurant.create(restaurant_params)
			redirect_to restaurants_path
		else
			render :new
		end
	end

	def update
		@restaurant = Restaurant.find(params[:id])
		if @restaurant.update(restaurant_params)
			redirect_to restaurants_path
		else
			render :edit
		end
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		if @restaurant.destroy
			redirect_to restaurants_path
		else
			render :index
		end
	end

	private

	def restaurant_params
		params.require(:restaurant).permit(:name, :address)
	end
end