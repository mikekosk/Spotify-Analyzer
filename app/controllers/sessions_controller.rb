class SessionsController < ApplicationController

  def new
  end

  def create
    receive_spotify_callback
    user = User.find_by(email: @email.downcase)
    if user
      log_in(user, @hash)
    else
      new_user(@email)
      log_in(user, @hash)
    end
    flash[:success] = 'Welcome!'
    redirect_to user
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
