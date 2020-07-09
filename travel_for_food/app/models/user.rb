class User < ApplicationRecord 
    has_many :reviews 
    has_many :restaurants, through: :reviews 
    validates :email, presence: true, uniqueness: true
    validates :name, presence: true
    has_secure_password
end 