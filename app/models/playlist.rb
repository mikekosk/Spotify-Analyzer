class Playlist < ApplicationRecord
  has_many :tracks
  belongs_to :user
  validates :user_id, presence: true
  validates :playlist_obj, presence: true
  serialize :playlist_obj
end
