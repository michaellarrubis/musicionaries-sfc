class DetailSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :title

  has_many :selected_song
end