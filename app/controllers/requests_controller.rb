class RequestsController < ApplicationController
  def index
    @room = Room.find(params[:room_id])
    @requests= @room.requests.includes(:user)
  end

  def new
    @request = Request.new
    @room = Room.find(params[:room_id])
  end

  def create
    @room = Room.find(params[:room_id])
    @request = @room.requests.new(request_params)
    if @request.save
      redirect_to room_request_path(@room)
    else
      render :new
    end
  end

  private

  def request_params
    params.require(:request).permit(:title, :content, :image).merge(user_id: current_user.id)
  end
end
