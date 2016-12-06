class Admin::WorkshopsController < AdminController

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

  private
  def workshop_params
    params.require(:workshop).permit(:name, :user_id)
  end
end
