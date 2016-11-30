class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @workshops = Workshop.all
    @user = User.find(params[:id])
  end

  def search_by
    if params[:value].empty?
      redirect_to users_path and return
    else
      @users = User.search_by(params[:field], params[:value])
      render 'index' and return
    end
  end
end
