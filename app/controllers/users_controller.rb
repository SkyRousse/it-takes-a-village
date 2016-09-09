class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:current_user_id] = @user.id
      redirect_to user_path(@user)
    else
      render new
    end
  end

  def update
   @user = User.find(params[:id])
   if @user.update(user_params_update)
     flash[:notice] = "User info successfully updated!"
     redirect_to user_path(@user)
   else
     render :show
   end
 end

private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def user_params_update
    params.require(:user).permit(:email, :name, :about, :profile_pic, :skills, :zip, :likes_to)
  end

end
