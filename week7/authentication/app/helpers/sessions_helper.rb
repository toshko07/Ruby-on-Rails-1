module SessionsHelper
  def user_email
    if cookies[:user_email]
      "#{cookies[:user_email]}"
    end
  end
end
