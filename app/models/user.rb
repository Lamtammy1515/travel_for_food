class User < ApplicationRecord 
    has_many :reviews 
    has_many :restaurants, through: :reviews 
    validates_uniqueness_of :username
    validates_presence_of :email, :username, :password
    has_secure_password

   def hello 
   end 
end 