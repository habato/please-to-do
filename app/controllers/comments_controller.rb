class CommentsController < ApplicationController
  before_action :set_request, only: :create
  before_action :outsider, only: :create
  before_action :done, only: :create
  
  def create
    @comments = @request.comments.includes(:user)
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to request_path(@comment.request.id)
    else
      render template: "requests/show"
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if current_user.id == comment.user_id
      comment.destroy
      redirect_to request_path(comment.request.id)
    else
      redirect_to root_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, request_id: params[:request_id])
  end

  def set_request
    @request = Request.find(params[:request_id])
  end

  def outsider
    redirect_to root_path unless @request.room.users.exists?(current_user.id)
  end

  def done
    redirect_to root_path if @request.completion.present?
  end
end
