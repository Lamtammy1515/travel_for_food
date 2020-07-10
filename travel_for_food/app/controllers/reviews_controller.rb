class ReviewsController < ApplicationController 
    def index 
        @reviews = Review.all 
    end 

    def show 
        @review = Review.find(params[:id])
    end 


    def new 
        @review = Review.new 
    end 

    def create 
        @review = Review.new(review_params)
        @review.user_id = session[:user_id]
     
        if @review.save 
            redirect_to user_reviews_path(@review)
        else 
            render :new 
        end 
    end 

    private
  def review_params
    params.require(:review).permit(:title, :review, :image, :star_rating, :user_id, :location_id)
  end
end 