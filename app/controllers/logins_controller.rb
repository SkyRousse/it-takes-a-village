class LoginsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.where(:email => params[:email].downcase).first
    if user && user.authenticate(params[:password])
      flash[:notice] = "You have been logged in"
      session[:current_user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:notice] = "There was a problem logging in, please try again"
      render :new
    end
  end

  def destroy
    @_current_user = session[:current_user_id] = nil
    flash[:notice] = "Thanks for visiting, come back soon"
    redirect_to root_url
  end
end
