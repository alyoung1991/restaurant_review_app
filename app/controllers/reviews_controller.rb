class ReviewsController < ApplicationController
	def index
		@reviews = Review.all
	end

	def new
		@review = Review.new
	end

	def edit
		@review = Review.find(params[:id])
	end

	def create
		if Review.create(review_params)
			redirect_to root_path
		else
			render :new
		end
	end

	def update
		@review = Review.find(params[:id])
		if @review.update(review_params)
			redirect_to root_path
		else
			render :edit
		end
	end

	def destroy
		@review = Review.find(params[:id])
		if @review.destroy
			redirect_to root_path
		else
			render :index
		end
	end

	private

	def review_params
		params.require(:review).permit(:restaurant, :rating, :review)
	end
end