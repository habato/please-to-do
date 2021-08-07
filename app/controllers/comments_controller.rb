class CommentsController < ApplicationController
  def create
    @request = Request.find(params[:request_id])
    redirect_to root_path if @request.completion.present?
    @comments = @request.comments.includes(:user)
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to request_path(@comment.request.id)
    else
      render template: "requests/show"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    redirect_to root_path unless current_user.id == @comment.user_id
    @comment.destroy
    redirect_to request_path(@comment.request.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, request_id: params[:request_id])
  end
end
