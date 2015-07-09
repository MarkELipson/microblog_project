class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    if params[:user][:password] == params[:password_confirmation]
      @user = User.create user_params
      session[:user_id] = @user.id
      flash[:notice] = "Thanks for Signing Up"
      redirect_to posts_path
    else
      flash[:alert] = "Your password did not match confirmation"
      redirect_to new_post_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :birthday)
  end
end
