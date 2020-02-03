class SelectedSongSerializer
  include FastJsonapi::ObjectSerializer

  belongs_to :songs
  belongs_to :details
end