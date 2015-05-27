class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path, notice: "Logged in!"
      cookies[:user_email] = user.email if params[:remember_me] == "1"
    else
      render :new
    end
  end

  def user
    @user = current_user
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
