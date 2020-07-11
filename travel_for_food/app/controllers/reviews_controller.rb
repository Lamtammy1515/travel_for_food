class ReviewsController < ApplicationController 
    before_action :require_login
    def index
        find_user
        @reviews = @user.reviews.all
      end
    
      def show
        find_user
        find_review
      end
    
      def new 
        set_user
        find_review
        @review = Review.new
        @review = Restaurant.new 
        @review = Location.new 
      end

    def create 
        @review = Review.build(review_params)
        @review.user_id = session[:user_id]
        if @review.save 
            redirect_to user_reviews_path(@review)
        else 
            render :new 
        end 
    end 

    private
    
    def find_user
      @user = User.find_by(id: params[:user_id])
    end
  
    def find_review
      @review = Review.find_by(params[:id])
    end
  
    def find_location
      @location = Location.find_by(id: params[:location_id])
    end
  

  def review_params
    params.require(:review).permit(:title, :review, :image, :star_rating, :user_id)
  end
end 