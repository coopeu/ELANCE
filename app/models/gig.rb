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

	def skill_list=(skills_string)
		skill_names = skills_string.split(',').collect{ |s| s.strip.downcase }.uniq
		new_or_found_skills = skill_names.collect{ |name| Skill.find_or_create_by(name: name)}
		self.skills = new_or_found_skills
	end	

	def skill_list
		self.skills.collect do |skill|
			skill.name
		end.join(', ')
	end

end