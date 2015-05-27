module ApplicationHelper
  def current_user_exists?
    !!current_user
  end
end
