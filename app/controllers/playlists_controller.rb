class PlaylistsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :connect_spotify

  def create
    @user = current_user
    spotify_playlist = @spotify_user.create_playlist!('TEST PLAYLIST')
    playlist = @user.playlists.build(playlist: spotify_playlist)
    #@playlist = @u.playlist.build(playlist: spotify_playlist)
    if playlist.save
      flash[:success] = "Playlist created!"
      redirect_to current_user
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

    def connect_spotify
      @spotify_user = RSpotify::User.new(session[:hash])
    end

end
