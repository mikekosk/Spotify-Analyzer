class TracksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    boot_twilio

    # Find User's Active Playlist
    @user = current_user
    playlist = @user.playlists.find_by(is_active: true)

    # Parse Message for Content
    # message_body = params["Body"]
    # from_number = params["From"]
    message_body = 'strandbar'
    from_number = '17086200013'

    # Save Track and Artist locally
    tracks = RSpotify::Track.search(message_body, limit: 1)
    playlist.playlist_obj.add_tracks!(tracks)
    track = playlist.tracks.build(song: tracks.first.name, artist: tracks.first.artists[0].name)

    # Send Message
    @client.messages
      .create({
        from: '16304267198',
        to: from_number,
        body: "I added the song #{track.song} by #{track.artist}."
      })

    # Redirect to user page if successful
    if track.save
      flash[:success] = "Track Added!"
      redirect_to current_user
    else
      render 'static_pages/home'
    end
  end

    private

      def boot_twilio
        # account_sid = 'ACd3f3ddb0a84556b722a94afaf6896a29'
        # auth_token = 'de87d697b3813672be3ce7ae9fc3a989'
        account_sid = current_user.Accountid
        auth_token = current_user.Authtoken
        @client = Twilio::REST::Client.new(account_sid, auth_token)
      end

end
