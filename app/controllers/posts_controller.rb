class PostsController < ApplicationController
  def new
    @post = current_user.posts.build 
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_url
    else
      render 'posts/new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
