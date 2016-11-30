class WorkshopsController < ApplicationController
  before_action :set_workshop, only: [:show, :edit, :update]

  def index
    if params[:user_id]
      @workshops = User.find_by(id: params[:user_id]).workshops
    else
      @workshops = Workshop.all
    end
  end

  def show
  end

  def new
    @workshop = Workshop.new
  end

  def create
    @workshop = Workshop.new(workshop_params)
    if @workshop.save
      redirect_to @workshop, notice: 'Workshop created successfully'
    else
      render action: 'new', alert: "Creation failed:  #{@workshop.errors.full_messages}"
    end
  end

  def edit
  end

  def update
    if @workshop.update(workshop_params)
      redirect_to @workshop, notice: 'Workshop updated'
    else
      render action: 'edit', alert: "Update failed:  #{@workshop.errors.full_messages}"
    end
  end

  private
  def set_workshop
    @workshop = Workshop.find(params[:id])
  end

  def workshop_params
    params.require(:workshop).permit(:name, :skill_ids=> [], :skills_attributes => [:title, :content, :_destroy])
  end

end
