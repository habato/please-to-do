class RequestsController < ApplicationController
  before_action :set_room, only: [:index, :new, :create]
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  def index
    @requests = @room.requests.includes(:user)
  end

  def new
    @request = Request.new
  end

  def create
    @request = @room.requests.new(request_params)
    if @request.save
      redirect_to room_requests_path(@room)
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @request.comments.includes(:user)
  end

  def edit
  end

  def update
    if @request.update(request_params)
      redirect_to request_path(@request)
    else
      render :edit
    end
  end

  def destroy
    @request.destroy
    redirect_to room_requests_path(@request.room.id)
  end

  private

  def request_params
    params.require(:request).permit(:title, :content, :image).merge(user_id: current_user.id)
  end

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_request
    @request = Request.find(params[:id])
  end
end
