class CommentsController < ApplicationController
  def create
    @request = Request.find(params[:request_id])
    @comments = @request.comments.includes(:user)
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to request_path(@comment.request.id)
    else
      render template: "requests/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, request_id: params[:request_id])
  end
end
