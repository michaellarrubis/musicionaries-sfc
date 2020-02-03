class SongSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :title, :artist, :lyrics_and_chords
  has_many :selected_song
end