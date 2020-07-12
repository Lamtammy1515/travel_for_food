class LocationsController < ApplicationController 
    before_action :require_login
    def index 
        @locations = Location.all.order(:country).uniq
    end 

    def show 
        @location = Location.find_by_id(params[:id])
        @review = Review.find_by_id(params[:location_id])
    end 
end 