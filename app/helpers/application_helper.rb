module ApplicationHelper
  def is_officer?(workshop = nil)
      @workshop.try(:officer) == current_user || workshop.try(:officer) == current_user
  end

  def is_admin?
    current_user.admin?
  end
end
