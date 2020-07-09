class Restaurant < ApplicationRecord 
belongs_to :location 
has_many :users, through: :reviews 
validates_presence_of :name 
end 