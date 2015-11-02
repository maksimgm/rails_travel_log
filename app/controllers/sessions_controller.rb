class SessionsController < ApplicationController
  before_action :prevent_login_signup, only: [:signup, :create, :login, :attempt_login]

  def index
    @trips = Trip.all
  end

  def signup
    @user = User.new
  end

  def login

  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "You are now logged in, #{params[:username]}!"
      redirect_to home_path
    else
      render :signup
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged out!"
    redirect_to login_path
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = User.where(username: params[:username]).first
      if found_user && found_user.authenticate(params[:password])
        session[:user_id] = found_user.id
        flash[:notice] = "Welcome back #{params[:username]}!"
        redirect_to home_path
      else
        flash[:alert] = "username / password combination is invalid"
        redirect_to login_path(@user)
      end
    else
      flash[:alert] = "please enter username and password"
      redirect_to login_path
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end