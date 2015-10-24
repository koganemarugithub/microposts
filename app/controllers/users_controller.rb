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
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
  end
  ## 上記部分まで課題
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
    :password_confiremation)
  end
end
