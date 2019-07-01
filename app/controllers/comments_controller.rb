class CommentsController < ApplicationController
  
  def create
   @post=Post.find(params[:post_id])
   @comment = @post.comments.build(comment_params)
   @comment.user_id = current_user.id
   if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @post=Post.find(params[:post_id])
    @comment = @post.comments.find_by(id: params[:id])
    @comment.destroy
    flash[:success] = "comment deleted"
    redirect_to request.referrer || root_url
  end
  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
