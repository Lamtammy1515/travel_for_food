class User < ApplicationRecord 
    has_many :reviews 
    has_many :restaurants, through: :reviews 
    validates_uniqueness_of :username
    has_secure_password
   
    def self.create_by_github_omniauth(auth)
        self.find_or_create_by(username: auth[:info][:nickname]) do |u|
          u.username = auth[:info][:nickname]  
          u.password = SecureRandom.hex
        end
      end
end 