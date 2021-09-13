class User < ApplicationRecord 
    has_many :reviews 
    has_many :restaurants, through: :reviews 
    validates_uniqueness_of :username
<<<<<<< HEAD
    validates_presence_of :email, :username, :password
    has_secure_password

   def hello 
   end 
=======
    has_secure_password
    scope :active_reviewer, -> { joins(:reviews).group('reviews.user_id').order("count(reviews.user_id) desc").limit(1)}
    def self.create_by_github_omniauth(auth)
        self.find_or_create_by(username: auth[:info][:nickname]) do |u|
          u.username = auth[:info][:nickname]  
          u.password = SecureRandom.hex
        end
      end
>>>>>>> cf66098562db38baa90e411c13a42298b12adde5
end 