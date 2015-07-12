class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
  end

  def create
    if ((params[:user][:password] == params[:password_confirmation]) && !(params[:user][:username].to_s.blank?))
      @user = User.create user_params
      session[:user_id] = @user.id
      flash[:notice] = "Thanks for Signing Up"
      redirect_to posts_path
    else
      flash[:alert] = "Please verify your information"
      redirect_to "/users/new"
    end
  end
  
  def show
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :birthday)
  end
end
