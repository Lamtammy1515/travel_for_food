class Review < ApplicationRecord 
    belongs_to :user
    validates_inclusion_of :star_rating, :in => 1..5
    validates :review, presence: true
    validates :star_rating, presence: true
    validates :title, presence: true


end