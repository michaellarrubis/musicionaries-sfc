class SelectedSong < ApplicationRecord
  belongs_to :song
  belongs_to :detail
end
