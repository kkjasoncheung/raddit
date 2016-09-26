class PostsController < ApplicationController
  
  layout 'public'

  before_action :check_logged_in, :except=>[:show, :popular]

  def index
    @posts = Post.search((params[:q].present? ? params[:q] : '*')).records
  end

  def new
    @subraddits = Subraddit.all
  end

  def create
    
    @post = Post.new(post_params)
    # setting a default value for user_id for now
    @post.user_id = session[:user_id]
    # setting a default value for the subraddit for now
    @post.votes = 1
    if @post.save
      flash[:notice]='New post created'
      # change redirect_to show after show action completed
      redirect_to(:controller=>'posts', :action=>'show', :post_id=>@post.id)
    else
      @subraddits = Subraddit.all
      render('new')
    end

  end

  def edit
    @post = Post.find(params[:id])
    @subraddits = Subraddit.all
  end

  def update
    @post = Post.find(params[:id])
    @subraddits = Subraddit.all

    @post.update_attributes(post_params)

    if @post.save 
      flash[:notice]="Post updated"
      redirect_to(:action=>'show', :post_id=>@post.id)
    else
      flash[:notice]="Erorr updating post"
      render('edit')
    end
  end

  def delete
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      flash[:notice]='Post deleted'
      redirect_to(:controller=>'public', :action=>'index')
    else 
      render('delete')
    end
  end

  def show
    @post = Post.find(params[:post_id])
  end

  def remove_image
    @post = Post.find(params[:id])
    @post.image = nil
    if @post.save
      flash[:notice]="Image has been removed."
      redirect_to(:action=>'show', :post_id=>@post.id)
    end
  end

  def upvote
    post = Post.find(params[:id])
    post.votes = post.votes + 1
    post.save
    session[:upvote] = true
    redirect_to(:controller=>'public', :action=>'index')
  end

  def upvote_show 
    post = Post.find(params[:id])
    post.votes = post.votes + 1
    post.save
    session[:upvote] = true
    redirect_to(:controller=>'posts',:action=>'show', :post_id=>post.id)
  end

  def downvote
    post = Post.find(params[:id])
    post.votes = post.votes-1
    post.save
    session[:upvote] = false
 
    redirect_to(:controller=>'public', :action=>'index')    
  end 

  def downvote_show
 
    post = Post.find(params[:id])
    post.votes = post.votes-1
    post.save
    session[:upvote] = false
    redirect_to(:controller=>'posts', :action=>'show', :post_id=>post.id)    
  end

  def popular
    @posts = Post.votes_desc
  end
  private

    def post_params
      params.require(:post).permit(:title, :content, :subraddit_ids, :image)
    end
end
