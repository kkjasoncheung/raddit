class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  	def check_logged_in
  		if session[:username].blank?
  			redirect_to(:controller=>'login', :action=>'index')
  		end
  	end
end
