class AddActiveToPlaylists < ActiveRecord::Migration[5.2]
  def change
    add_column :playlists, :is_active, :boolean
  end
end
