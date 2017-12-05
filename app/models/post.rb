class Post < ApplicationRecord

#has_many :comments, dependent: :destroy
has_many :comments, as: :commentable, dependent: :destroy

acts_as_votable

validates :name,  :presence => true
validates :title, :presence => true, :length => { :minimum => 8 }
validates :content, :presence => true, :length => { :minimum => 25 }


end
