class WorkshopsController < ApplicationController
  before_action :set_workshop, only: [:show, :edit, :update, :is_officer?, :select_officer]
  before_action :is_officer?, only: [:edit, :new, :update, :create]

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
      officer = User.find_by(id: params[:workshop][:user_id])
      if !!officer
        if @workshop.update(officer: officer)
          redirect_to @workshop, notice: 'Workshop updated'
        end
      else
      redirect_to @workshop, notice: 'Workshop updated'
      end
    else
      render action: 'edit', alert: "Update failed:  #{@workshop.errors.full_messages}"
    end
  end

  private
  def set_workshop
    @workshop = Workshop.find(params[:id])
  end

  def workshop_params
    params.require(:workshop).permit(:name, :user_id, :skill_ids=> [], :skills_attributes => [:title, :content, :_destroy])
  end
end
