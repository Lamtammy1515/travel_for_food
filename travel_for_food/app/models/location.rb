class Location < ApplicationRecord
    has_many :restaurants 
    has_many :reviews, through: :restaurants
    validates_presence_of :city, :country
end
