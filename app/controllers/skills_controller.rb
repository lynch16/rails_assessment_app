class SkillsController < ApplicationController
  before_action :set_skill, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @skill = Skill.new(workshop_id: params[:workshop_id])
  end

  def create
    @skill = Skill.new(skill_params)
    if @skill.save
      redirect_to workshop_path(@skill.workshop_id), notice: 'New skill created successfully'
    else
      render action: 'new', alert: "Creation failed:  #{@skill.errors.full_messages}"
    end
  end

  def edit
  end

  def update
    if @skill.update(skill_params)
      redirect_to workshop_path(@skill.workshop_id), notice: 'Skill updated'
    else
      render action: 'edit', alert: "Update failed: #{@skill.errors.full_messages}"
    end
  end

  def destroy
    @workshop = @skill.workshop
    @skill.destroy
    if !!@workshop
      redirect_to workshop_path(@workshop), notice: 'Skill deleted'
    else
      redirect_to workshops_path
    end
  end

  private
  def skill_params
    params.require(:skill).permit(:title, :description, :workshop_id)
  end

  def set_skill
    @skill = Skill.find(params[:id])
  end

end
