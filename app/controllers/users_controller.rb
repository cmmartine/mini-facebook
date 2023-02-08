class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def accept_request
    @request = Request.all.find(params[:id])
    one_half = Friendship.create(user_id: current_user.id, friend_id: @request.sending_user_id)
    second_half = Friendship.create(user_id: @request.sending_user_id, friend_id: current_user.id)

    if one_half.save && second_half.save
      flash[:notice] = 'Friend request accepted.'
    else
      flash[:notice] = 'Acceptance not saved, please try again.'
    end
    redirect_back fallback_location: users_path
  end
end
