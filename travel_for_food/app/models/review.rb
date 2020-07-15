class Review < ApplicationRecord 
    belongs_to :user
    belongs_to :restaurant
    belongs_to :location
    validates_inclusion_of :star_rating, :in => 1..5
    validates :review, presence: true
    validates :star_rating, presence: true
    validates :title, presence: true
    accepts_nested_attributes_for :location, reject_if: :all_blank, allow_destroy: true
    accepts_nested_attributes_for :restaurant, reject_if: :all_blank, allow_destroy: true
 
end