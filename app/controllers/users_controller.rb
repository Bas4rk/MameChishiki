class UsersController < ApplicationController 
  before_action :sign_in_required, only: [:show]
  before_action :authenticate_user!, except: [:index]
  def index
    @users = User.paginate(page:params[:page])
  end

  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(page:params[:page])
  end

  def edit
    @user = User.find(params[:id])  
  end

  def update
    @user = User.find(params[:id])  
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end

  end

  private

  def user_params
    params.require(:user).permit(:username,:introduction,:image)
  end

end
