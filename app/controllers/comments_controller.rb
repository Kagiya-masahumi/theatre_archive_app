class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)
    redirect_to "/performances/#{comment.performance.id}"

  end


  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, performance_id: params[:performance_id])
  end
end
