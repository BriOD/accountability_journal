class UsersController < ApplicationController
  def signup
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Successfully Signed up!"
      redirect_to root_path
    else
      flash[:error] = "Unsuccessful Signed up. Please try again."
      render 'users/signup'
    end
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end
