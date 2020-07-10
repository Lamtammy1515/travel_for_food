class Review < ApplicationRecord 
    belongs_to :user
    validates_inclusion_of :star_rating, :in => 1..5
    validates_numericality_of :star_rating, :only_integer => true
    validates :review, presence: true
    validates :city, presence: true
    validates :star_rating, presence: true
    validates :title, presence: true

    def location_attributes=(attributes)
        if attributes[:city] != ""
          city = Location.find_or_create_by(name: attributes[:city])
        if attributes[:country] != ""
          country = Location.find_or_create_by(name: attributes[:country])
        else
          country = Location.find_by(id: attributes[:country_id])
        end
        country.cities << city if city != "" && country != ""
        country.save if country != ""
        self.location_id = location.id
        end
      end
end