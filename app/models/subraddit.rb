class Subraddit < ApplicationRecord

	# adding searchkick gem

	searchkick

	# Relationships
	has_and_belongs_to_many :posts # DONE
	# need to create an FK table containing post_id and subraddit_id , no primary id, :id=>false
end
