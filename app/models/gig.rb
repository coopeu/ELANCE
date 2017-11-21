class Gig < ActiveRecord::Base
	belongs_to :user
	has_many :proposals
	belongs_to :category
	has_many :abilities
	has_many :skills, through: :abilities

	validates :user_id, presence: true
	validates :category_id, presence: true

	def self.search(term)
#		gigs = Gig.where('name like ? or description like ?','%#{params[:search]}','%#{params[:search]}')	if params[:search].present?
#		gigs = Gig.where('name LIKE ?', '%#{term}%').order('id DESC')
#		gigs	
#		if term
    	where('name LIKE ? or description like ?', "%#{term}%",'%#{term}%')
#  	else
#    	all
#  	end
	end	

#	def self.search(term)
#		if term
#			gigs = Gig.where('name LIKE ?', '%#{term}%').order('id DESC')
#
#		else
#			flash[:notice] = "No results found"
#	end

end