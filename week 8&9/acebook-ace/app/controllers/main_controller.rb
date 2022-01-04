class MainController < ApplicationController
  skip_before_action :require_login
  skip_before_action :require_logout, :only => [:destroy]

  def index
    @users = User.all
  end

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to post_images_path, notice: 'Logged in Succesfully'
    else
      redirect_to root_path, alert: 'Login failed'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out'
  end

  private

  def post_params
    params.require(:user).permit(:email, :password)
  end
end
