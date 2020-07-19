class RestaurantsController < ApplicationController 
  before_action :require_login
def index 
    @restaurants = Restaurant.all.order(:name).uniq
end 

def show 
    @restaurant = Restaurant.find_by_id(params[:id])
    @review = Review.find_by_id(params[:restaurant_id])
end 

end 