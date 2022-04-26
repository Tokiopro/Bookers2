class UsersController < ApplicationController
  
  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
      if @user == current_user
        render :edit
      else
        redirect_to user_path(current_user.id)
      end
  end
  
  def update
    @user = User.find(params[:id])
    @user.upfate(user_params)
    redirect_to user_path(current_user.id)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:profile_image)
  end
end
