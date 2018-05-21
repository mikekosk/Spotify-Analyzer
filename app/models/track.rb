class Track < ApplicationRecord
  belongs_to :playlist
  serialize :artist

end
