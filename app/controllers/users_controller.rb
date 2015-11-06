class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  before_action :confirm_logged_in

  def home
    # orginize trip logic...and order
    @trips = Trip.order('id desc')
  end

  def show
  
  end

  def edit
  
  end

  def update
    @user.update user_params
    if @user.save
      flash[:success] = "#{@user.username} updated!"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy && session[:user_id] = nil
    flash[:notice] = "#{@user.username} deleted!"
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:profile_pic, :username, :bio, :email)
  end

  def ensure_correct_user
    # compare some params vs something in the session/current_user
    unless params[:id].to_i == session[:user_id]
      redirect_to root_path, alert: "Not Authorized"
    end
  end
end
