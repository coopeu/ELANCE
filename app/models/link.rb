class Link < ApplicationRecord

	belongs_to :user
	acts_as_votable
	#has_many :comments, :issues
	belongs_to :category, :optional => true
	has_many :comments, as: :commentable, dependent: :destroy
	has_many :issues, as: :commentable, dependent: :destroy

	validates :title, presence: true
	validates :category_id, presence: true
	validates :url, presence: true, uniqueness: true


	extend FriendlyId
  	



end
