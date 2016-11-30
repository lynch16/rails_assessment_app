class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
    @workshops = Workshop.all
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User updated'
    else
      render action: 'edit', alert: "Update failed:  #{@user.errors.full_messages}"
    end
  end

  def search_by
    if params[:value].empty?
      redirect_to users_path and return
    else
      @users = User.search_by(params[:field], params[:value])
      render 'index' and return
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :skill_ids =>[])
  end

  def set_user
    @user = User.find(params[:id])
  end
end
