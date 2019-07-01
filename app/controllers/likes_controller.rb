class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post.likes.create(user_id: current_user)
  end

  def destroy
    @post = Post.find(params[:id]).post
    @post.likes.find_by(user_id: current_user.id).destroy
  end
end
