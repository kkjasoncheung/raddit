class Comment < ApplicationRecord

	# Relationships

	belongs_to :post
		# need post_id in db
	belongs_to :user
		# need user_id in db
	belongs_to :link
		# need link_id in db

	# validations

	validates :content, :presence => true
end
