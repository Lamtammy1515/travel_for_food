class Restaurant < ApplicationRecord 
belongs_to :location 
has_many :users, through: :reviews 
end 