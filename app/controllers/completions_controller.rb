class CompletionsController < ApplicationController
  before_action :set_request, only: :create
  before_action :done, only: :create

  def create
    if Completion.create(user_id: current_user.id, request_id: @request.id)
      redirect_to room_requests_path(@request.room.id)
    else
      render :show
    end
  end

  private

  def set_request
    @request = Request.find(params[:request_id])
  end

  def done
    redirect_to root_path if @request.completion.present?
  end
end
