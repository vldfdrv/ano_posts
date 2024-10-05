class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(login: params[:login])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to posts_path, notice: "Successfully logged in"
    else
      redirect_to log_in_path, alert: 'Invalid email or password'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to log_in_path, notice: 'Logged out successfully.'
  end
end