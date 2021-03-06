class SessionsController < ApplicationController

  def new
    if @current_user
      redirect_to "/images/new"
    end
  end

  def create
    user = User.find_by_name(params[:name])
    if user.present? # && user.authenticate(params[:name])
      session[:user_id] = user.id
      redirect_to "/images/new"
      flash[:success] = "You have successfully signed in."
    else
      redirect_to signin_path
      flash[:error] = "Something went wrong. Please try again."
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
    flash[:success] = "You have successfully signed out."
  end


end
