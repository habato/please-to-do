class RoomsController < ApplicationController
  before_action :set_room, only: [:edit, :update]

  def index
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @room.update(room_params)
      redirect_to room_requests_path(@room)
    else
      render :edit
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy if room.users.exists?(current_user.id)
    redirect_to root_path
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end

  def set_room
    @room = Room.find(params[:id])
  end
end
