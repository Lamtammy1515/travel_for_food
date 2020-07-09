class RestaurantsController < ApplicationController 
    def index 
        @restaurants = Restaurant.all 
    end 

    def show 
        @restaurant = Restaurant.find(params[:id])
    end 


    def new 
        @restaurant = Restaurant.new 
    end 

    def create 
        @restaurant = Restaurant.create(restaurant_params)
        if @restaurant.save 
            redirect_to new_review_path
        else 
     
            render :new 
        end 
    end 

    private
  def restaurant_params
    params.require(:restaurant).permit(:name)
  end
end 