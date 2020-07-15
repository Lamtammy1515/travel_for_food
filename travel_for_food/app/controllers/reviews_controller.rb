class ReviewsController < ApplicationController 
    before_action :require_login
    def index

        @user = User.find_by(id: session[:user_id])
        
        @reviews = @user.reviews
      end
    
      def show
     
        find_user
       
        @review = Review.find_by_id(params[:id])
      end
    
      def new 
        set_user
        find_review
        @review = Review.new
      end

    def create 
        @review = Review.new(review_params)
        @location = Location.find_or_create_by(city: params[:review][:location][:city], country: params[:review][:location][:country])
        @restaurant = Restaurant.find_or_create_by(name: params[:review][:restaurant][:name], location_id: @location.id)
     
        
        @review.user_id = session[:user_id]
        @review.location_id = @location.id
        @review.restaurant_id = @restaurant.id
        if @review.save 
            redirect_to user_reviews_path(@review)
        else 
            render :new 
        end 
    end 

    def edit
    end
  
    def update
      set_user
      find_review
      if @review.update(review_params)
        @success = "Review Updated!"
        redirect_to user_reviews_path(@review)
      else
        render 'edit'
      end
    end
  
    def destroy
      set_user 
      find_review
      @review.destroy
      redirect_to user_reviews_path(@review)
    end
  

    private
    
    def find_user
      @user = User.find_by(id: session[:user_id])
    end
  
    def find_review
      @review = Review.find_by(params[:id])
    end
  
    def find_location
      @location = Location.find_by(id: params[:location_id])
    end


  def review_params
    params.require(:review).permit(:title, :review, :image, :star_rating, :user_id, location_attributes: [:id, :city, :country], restaurant_attributes: [:id, :name])
  end
end 