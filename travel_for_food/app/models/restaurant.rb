class Restaurant < ApplicationRecord 
belongs_to :location 
has_many :reviews
has_many :users, through: :reviews 
validates_presence_of :name 
validates :location_id, presence: true, numericality: { only_integer: true }
end 