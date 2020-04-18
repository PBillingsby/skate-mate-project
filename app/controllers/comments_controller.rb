class CommentsController < ApplicationController
  def new
  end
  def create
    byebug
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id, :spot_id)
  end
end