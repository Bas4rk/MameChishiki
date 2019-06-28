class CommentsController < ApplicationController
  
  def create
   @post=Post.find(params[:post_id])
   @comment = @post.comments.build(comment_params)
   @comment.user_id = current_user.id
   if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_to user_url(current_user)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
