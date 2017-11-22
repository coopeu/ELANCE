class Gig < ActiveRecord::Base
	belongs_to :user
	has_many :proposals
	belongs_to :category 
	has_many :abilities
	has_many :skills, through: :abilities

	geocoded_by :location
	after_validation :geocode
	#reverse_geocoded_by :latitude, :longitude
	#after_validation :reverse_geocode  # auto-fetch address

	validates :user_id, presence: true
	validates :category_id, presence: true

	def self.search(term)
    	where('name LIKE ? or description LIKE ? or location LIKE ?',"%#{term}%",'%#{term}%', "%#{term}%")
	end	

end