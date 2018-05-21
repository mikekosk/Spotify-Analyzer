class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.string :song
      t.references :playlist, foreign_key: true

      t.timestamps
    end
    add_index :tracks, [:playlist_id, :created_at]
  end
end
