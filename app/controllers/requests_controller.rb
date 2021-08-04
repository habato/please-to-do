class RequestsController < ApplicationController
  def index
    @room = Room.find(params[:room_id])
    @requests = @room.requests.includes(:user)
  end

  def new
    @request = Request.new
    @room = Room.find(params[:room_id])
  end

  def create
    @room = Room.find(params[:room_id])
    @request = @room.requests.new(request_params)
    if @request.save
      redirect_to room_requests_path(@room)
    else
      render :new
    end
  end

  def show
    @request = Request.find(params[:id])
  end

  def edit
    @room = Room.find(params[:room_id])
    @request = Request.find(params[:id])
  end

  def update
    @room = Room.find(params[:room_id])
    @request = Request.find(params[:id])
    if @request.update(request_params)
      redirect_to room_request_path(@room,@request.id)
    else
      render :edit
    end
  end

  private

  def request_params
    params.require(:request).permit(:title, :content, :image).merge(user_id: current_user.id)
  end
end
