class SpotifyController < ApplicationController

  before_action

  def playlist
    @user = User.find(params[:id])
    hash = session[:hash]
    puts hash
    spotify_user = RSpotify::User.new(hash)
    redirect_to current_user
  end

end
