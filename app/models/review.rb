class Review < ApplicationRecord 
    belongs_to :user
    has_one :restaurant
    has_one :location
    validates_inclusion_of :star_rating, :in => 1..5
    validates :review, presence: true
    validates :star_rating, presence: true
    validates :title, presence: true
    accepts_nested_attributes_for :location
    accepts_nested_attributes_for :restaurant
 
end