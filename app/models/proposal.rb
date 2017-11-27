class Proposal < ActiveRecord::Base
	belongs_to :gig
	belongs_to :user

	validates :bid, :presence => true
	validates	:description, :presence => true, :length => {:minimum => 25}   



end