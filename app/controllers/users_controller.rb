class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    spotify_user = RSpotify::User.new(session[:hash])
    puts ENV['SPOTIFY_CLIENT_ID']

    ## Select Playlist
    ## Do not query again if same playlist is used
    if params[:playlist_id]
      playlist_id = params[:playlist_id].to_i - 1
      if session[:playlist_id] != playlist_id
        @tracks = spotify_user.playlists[playlist_id].tracks(limit: 100)
        session[:tracks] = @tracks
      else ## Pull from session
        @tracks = session[:tracks]
      end
      session[:playlist_id] = playlist_id
    else
      @tracks = nil
    end

    ## Sort Playlist
    if params[:sort_by]
      sort_by = params[:sort_by]
      @tracks.sort_by{|a| a.audio_features.send(sort_by)}
    else
      @tracks
    end

    ## Save Playlist
    if params[:save] == 'true'
      ## Pull playlist name & sort style
      playlist_name = spotify_user.playlists[playlist_id].name
      sort_style = params[:sort_by]

      ## Create Playlist & Add Tracks
      new_playlist = spotify_user.create_playlist!("#{playlist_name},
        sorted by #{sort_style}")
      new_playlist.add_tracks!(@tracks)

      ## Redirect if successful
      flash[:success] = "Save Successful"
      redirect_to params.permit(:playlist_id, :sort_by)
        .merge({:playlist_id => 1})
    end
  end

end
