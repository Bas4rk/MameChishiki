class LikesController < ApplicationController

  def show
    @likes = Like.where(post_id: params[:post_id])
    @users = []
    @likes.each do |like|
      user = User.find(like.user_id)
      @users.push(user)
    end
  end

  def index
    @user = User.find(params[:user_id])
    @likes = Like.where(user_id: params[:user_id])
    @posts =[]
    @likes.each do |like|
      post =  Post.find(like.post_id)
      @posts.push(post)
    end
  end

  def create
    @post = Post.find(params[:post_id])
    unless @post.iine?(current_user)
      @post.iine(current_user)
      @post.reload
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end

  def destroy
    @post = Like.find(params[:id]).post
    if @post.iine?(current_user)
      @post.uniine(current_user)
      @post.reload
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end
end
