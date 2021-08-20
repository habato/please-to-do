class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def search
    @user = current_user
    @users = User.search(params[:keyword])
    render :show if @users == nil
  end
end
