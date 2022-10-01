module ApplicationHelper
  def current_controller?(names)
    names.include?(params[:controller]) unless params[:controller].blank? || false
  end
end
