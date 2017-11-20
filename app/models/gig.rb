class Gig < ActiveRecord::Base
	belongs_to :user
	has_many :proposals
	belongs_to :category
	has_many :abilities
	has_many :skills, through: :abilities

end