class User < ApplicationRecord

	has_secure_password

	# Relationships

	has_many :posts
	has_many :links
	has_many :comments
	
	scope :sorted, lambda{order("position ASC")}


	validates :username, :presence =>true,
						:length=>{:maximum=>25},
						:uniqueness => true

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

	
	validates :email, :presence => true,
						:uniqueness=>true,
						:format=>{:with=>EMAIL_REGEX},
						:confirmation => true

	validates :password, :presence=>true,
						:length=>{:maximum=>18},
						:confirmation=>true
end
