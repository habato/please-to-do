class RoomsController < ApplicationController
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

  def destroy
    room = Room.find(params[:id])
    if room.users.exists?(current_user.id)
      room.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end
end
