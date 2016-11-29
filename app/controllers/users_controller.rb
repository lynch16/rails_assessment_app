class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @workshops = Workshop.all
    @user = User.find(params[:id])
  end

end
