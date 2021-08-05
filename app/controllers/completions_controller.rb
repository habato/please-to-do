class CompletionsController < ApplicationController
  def create
    @request = Request.find(params[:request_id])
    if Completion.create(user_id: current_user.id, request_id: @request.id)
      redirect_to room_requests_path(@request.room.id)
    else
      render :show
    end
  end
end
