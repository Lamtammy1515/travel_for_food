class ReviewsController < ApplicationController 
    before_action :require_login
    def index
        @user = User.find_by(id: params[:user_id])
        @reviews = @user.reviews.all
      end
    
      def show
        find_user
        @user = User.find_by_id(params[:user_id])
        @review = Review.find_by_id(params[:id])
      end
    
      def new 
        set_user
        find_review
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

    def edit
    end
  
    def update
      if @review.update(review_params)
        redirect_to user_reviews_path(@review)
      else
        render 'edit'
      end
    end
  
    def destroy
      @review.destroy
      redirect_to user_reviews_path(@review)
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
    params.require(:review).permit(:title, :review, :image, :star_rating, :user_id, location_attributes: [:city, :country], restaurant_attributes: [:name])
  end
end 