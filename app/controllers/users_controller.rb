class UsersController < ApplicationController

  def new
    if params[:admin] == "true"
      @user = User.new
    end
  end

  def create
    @user = User.new(admin: true)
    @user.update(user_params)

    if @user.save
      redirect_to posts_path, notice: "Successfully created admin!"
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:login, :password, :password_confirmation, :firstname, :lastname, :prename, :region)
  end
end