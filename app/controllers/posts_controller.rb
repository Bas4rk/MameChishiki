class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
  end

  def new
    @post = current_user.posts.build 
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to user_url(current_user)
    else
      render 'posts/new'
    end
  end

  def destroy
    @post = current_user.posts.find_by(id: params[:id])
    @post.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end


  private

  def post_params
    params.require(:post).permit(:content,:title,:image)
  end
end
