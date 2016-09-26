class UsersController < ApplicationController

  before_action :check_logged_in, :except=>[:new, :create]

  def index
    @users = User.all.sorted
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      flash[:notice]="#{@user.username} has been updated!"
      redirect_to(:action=>'show', :id=>@user.id)
    else
      flash[:notice]="There was a problem updating #{@user.username}"
      render('edit')
    end

  end

  def new
  end

  def create  
    @user = User.new(user_params)
    
    if @user.save 
      flash[:notice]="Account successfully created!"
      redirect_to(:controller=>'public', :action=>'index')
    else
      flash[:notice]="Error creating account."
      render('new')
    end
  end

  def delete
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id])
    
    if user.destroy
      flash[:notice]="#{user.username} has been successfully deleted."
      redirect_to(:action=>'index')
    else
      render('delete')
    end


  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end
