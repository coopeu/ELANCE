class Post < ApplicationRecord

validates :name,  :presence => true
validates :title, :presence => true, :length => { :minimum => 8 }
validates :content, :presence => true, :length => { :minimum => 25 }

has_many :comments, dependent: :destroy

end
