class Link < ApplicationRecord
	# adding searchkick

	searchkick

	# Relationships
	belongs_to :user
		# add user_id
	belongs_to :post
		# add post_id
	has_many :comments
	
end
