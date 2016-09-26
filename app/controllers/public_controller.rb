class PublicController < ApplicationController

# this will show website 
	
  layout 'public'

  def index
  
  	@posts = Post.sorted
  	@comments = Comment.all

  end

  def show
  end


end
