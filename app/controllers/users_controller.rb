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

end
