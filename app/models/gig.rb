class Gig < ActiveRecord::Base
	belongs_to :user
	has_many :proposals
	belongs_to :category
	has_many :abilities
	has_many :skills, through: :abilities

	validates :user_id, presence: true
	validates :category_id, presence: true

end