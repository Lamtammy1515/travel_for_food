class RestaurantsController < ApplicationController 
    def index 
      get_location
    end 


    private
  def get_location
    @location ||= Location.find_by(id: params[:location_id])
  end


end 