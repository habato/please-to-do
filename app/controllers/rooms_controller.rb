class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @room = Room.new
  end
end