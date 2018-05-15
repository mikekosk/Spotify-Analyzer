class Playlist < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :playlist, presence: true
end
