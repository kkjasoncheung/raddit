class Post < ApplicationRecord



	# adding search kick gem

	searchkick

	# Relationships

	belongs_to :user # done
		# has user_id in db

	has_many :comments # done

	has_one :link # done

	has_and_belongs_to_many :subraddits # done
		# need to create a FK table b/w subraddits and posts

	# name scopes

	scope :sorted, lambda{order("created_at ASC")}

	scope :votes_desc, lambda{order("votes DESC")}
	# validations

	validates :title, :presence=>true

	validates :content, :presence=>true

	# paperclip gem

	has_attached_file :image, styles: {large:'600x600>', medium: "300x300>", thumb: "150x150#"}
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
