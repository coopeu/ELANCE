class Contact < MailForm::Base

	attribute :name, 					:validate => true
	attribute :email, 				:validate => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	attribute :message, 			:validate => true
	attribute :nickname, 			:captcha => true

	def headers 
		{
		:subject => 'Contact MailForm',	
		:to	=> 'consen@consen.org',
		:from => %('#{name}' <#{email}>)
		}
	end
end