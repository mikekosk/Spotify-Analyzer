class AddPlaylistObjToPlaylists < ActiveRecord::Migration[5.2]
  def change
    add_column :playlists, :playlist_obj, :text
  end
end
