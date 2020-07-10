class LocationsController < ApplicationController 

    def index 
        @locations = Location.all.order(:country)
    end 

    def show 
        @location = Location.find(params[:id])
    end 
end 