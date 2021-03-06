class CommentsController < ApplicationController
  def new
  end
  def create
    comment = Comment.create(comment_params)
    redirect_to comment.spot
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.delete
    flash[:alert] = "Comment deleted."
    redirect_to spot_path(comment.spot)
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id, :spot_id)
  end
end