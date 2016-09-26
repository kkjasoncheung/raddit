class CommentsController < ApplicationController
  

  before_action :check_logged_in
  

  def index
  end

  def show
  end

  def delete
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to(:controller=>'posts',:action=>'show', :post_id=>comment.post_id)
  end 
  def new
    @comment = Comment.new(comments_params)
  end

  def create
    @comment = Comment.new(comments_params)

    @comment.user_id = session[:user_id]

    @comment.post_id = params[:id]

    # adding a temp link_id
    @comment.link_id = 1

    if @comment.save
      redirect_to(:controller=>'posts',:action=>'show', :post_id=>@comment.post_id)
    else
      flash[:notice]="Comment cannot be blank"
      redirect_to :back
    end
  end

  def edit
  end

  private

    def comments_params
      params.require(:comment).permit(:content)
    end
end
