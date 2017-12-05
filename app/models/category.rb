class Category < ActiveRecord::Base

	has_many :gigs # used before
 	has_many :subcategories, :class_name => "Category", :foreign_key => "parent_id", :dependent => :destroy
  #belongs_to :parent_category, :class_name => "Category", optional: true
	belongs_to :parent, :class_name => "Category", optional: true

end