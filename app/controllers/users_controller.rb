class UsersController < ApplicationController

before_action :logged_in_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    active_songs = @user.playlists.find_by(is_active: true)
    @track = active_songs.tracks
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:phone, :email, :Accountid, :Authtoken)
    end

end
