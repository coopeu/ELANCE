class Comment < ApplicationRecord
  
  belongs_to :post

	validates :commenter, :presence => true
  validates :body, :presence => true, :length => {:in => 10..255}

end
