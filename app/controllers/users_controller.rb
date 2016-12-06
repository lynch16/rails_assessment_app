class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :allowed?]
  before_action :set_workshop, only: [:edit]
  before_action :allowed?, only: [:edit, :update]

  def index
    @users = User.all
  end

  def show
    @workshops = Workshop.all.sort_by(&:name)
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
    binding.pry
    params.require(:user).permit(:name, :email, :skill_ids =>[], :user_skills_attributes => [:skill_level, :id])
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_workshop
    @workshop = Workshop.find_by(id: params[:workshop_id])
  end

  def allowed?
    set_workshop
    unless current_user.try(:admin?) || @user == current_user || @workshop.try(:officer) == current_user
      redirect_to root_path, alert: "You are not allowed to access that page."
    end
  end
end
