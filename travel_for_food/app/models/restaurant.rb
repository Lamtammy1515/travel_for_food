class Restaurant < ApplicationRecord 
belongs_to :location 
has_many :reviews
has_many :users, through: :reviews 
validates_presence_of :name 
errors.add(:location, I18n.translate(:blank)
end 