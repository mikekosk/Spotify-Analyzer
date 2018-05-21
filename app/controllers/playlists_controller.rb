class PlaylistsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :connect_spotify

  def create
    @user = current_user

    spotify_playlist = @spotify_user.create_playlist!('Text 2 Spotify Playlist')
    playlist_db = @user.playlists.create(playlist_obj: spotify_playlist, is_active: false)

    if playlist_db.save
      flash[:success] = "Playlist created!"
      redirect_to current_user
    else
      render 'static_pages/home'
    end
  end

  def destroy
    playlist.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end

  def edit
    #make old playlist inactive
    playlist = Playlist.find_by(is_active: true)
    if playlist
      playlist.is_active = false
      playlist.save
    end

    #make new playlist active
    playlist = Playlist.find(params[:id])
    playlist.is_active = true
    playlist.save

    flash[:success] = 'Active Playlist Switched'
    redirect_to request.referrer
  end

  private

    def connect_spotify
      @spotify_user = RSpotify::User.new(session[:hash])
    end

    def micropost_params
      params.require(:playlist).permit(:name)
    end

end
