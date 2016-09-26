module ApplicationHelper

	def error_messages_for(name)
		render(:partial=>'application/error_messages', :locals=>{:name=>name})
	end


end
