class UsersController < ApplicationController

before_action :logged_in_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @playlist = @user.playlists
  end

  def edit
    @user = User.find(params[:id])
    puts 'edit'
    puts @user
  end

  def update
    @user = User.find(params[:id])
    puts '\n\n\n LOOK here \n\n\n'
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      # puts @user
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
