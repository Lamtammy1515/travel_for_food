class Location < ApplicationRecord
    has_many :restaurants 
    has_many :reviews, through: :restaurants
    validates_presence_of :city, :country
    def country_name
        country = self.country
        ISO3166::Country[country]
    end
end
