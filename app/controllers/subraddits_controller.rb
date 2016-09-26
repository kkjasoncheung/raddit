class SubradditsController < ApplicationController

  layout 'public'

  def index
      @subraddits = Subraddit.all
  end

  def show
    @subraddit = Subraddit.find(params[:id])
  end

  def edit
  end

  def new
  end

  def delete
  end
end
