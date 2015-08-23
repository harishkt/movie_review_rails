class ReviewsController < ApplicationController

	before_action :set_movie
	def index
       @reviews = @movie.reviews
	end

	def new
		@review = @movie.reviews.new
	end

	def create
		@review = @movie.reviews.new(params_review)
		if @review.save
		   redirect_to movie_reviews_path(@movie), notice: "Thanks for your review"
		else
			render :new
		end
	end


private
	def params_review
        params.require(:review).permit(:name,:stars,:comment)
	end

	def set_movie
  		@movie = Movie.find(params[:movie_id])
	end 
end
