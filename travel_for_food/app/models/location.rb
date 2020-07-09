class Location < ApplicationRecord
    has_many :restaurants 
    has_many :reviews, through: :restaurants
end
