class LocationsController < ApplicationController 

    def index 
        @locations = Location.all 
    end 

    def show 
        @location = Location.find(params[:id])
    end 

    def new 
        @location = Location.new 
    end 

    def create 
        @location = Location.create(location_params)
        if @location.save 
            redirect_to new_location_restaurant_path(@location)
        else 
            render :new 
        end 
    end 

    private
  def location_params
    params.require(:location).permit(:city, :country)
  end
end 