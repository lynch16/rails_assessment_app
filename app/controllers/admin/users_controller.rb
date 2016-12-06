class Admin::UsersController < AdminController
  before_action :set_user, only: [:show, :edit, :update, :allowed?]
  before_action :set_workshop, only: [:edit]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'User created successfully'
    else
      render action: 'new', alert: "Creation failed:  #{@user.errors.full_messages}"
    end
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

  private
  def user_params
    params.require(:user).permit(:name, :email, :skill_ids =>[], :user_skills_attributes => [:skill_level, :id])
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_workshop
    @workshop = Workshop.find_by(id: params[:workshop_id])
  end
end
