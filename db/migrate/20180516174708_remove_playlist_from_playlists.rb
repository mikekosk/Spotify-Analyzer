class RemovePlaylistFromPlaylists < ActiveRecord::Migration[5.2]
  def change
    remove_column :playlists, :playlist, :string
  end
end
