class LoginController < ApplicationController

  layout 'public'


  def index

  	# displays the forms

  end

  def attempt_login
  	if params[:username].present? && params[:password].present?
  		found_user = User.where(:username=>params[:username]).first

  		if found_user
  		  	authorized_user = found_user.authenticate(params[:password])
  		end 
  	end  

  	if authorized_user
  		session[:user_id] = authorized_user.id
  		session[:username] = authorized_user.username
  		redirect_to(:controller=>'public', :action=>'index')
  	else

  		render('index')
  	end

  end

  def logout
      session[:upvote] = nil
	  	session[:username]= nil
	  	session[:user_id]=nil
	  	flash[:notice]='Logged out'
	  	# redirect_to(:controller=>'public', :action=>'index')
	   redirect_to :back
  end

end
