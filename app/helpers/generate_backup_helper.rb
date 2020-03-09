module GenerateBackupHelper
  include ApplicationHelper

  # download = open('http://localhost:3000/api/v1/events')
  # IO.copy_stream(download, 'events.json')

  def events_json
    require 'open-uri'

    event_filename = "#{current_timestamp}-events.json"
    event_api_link = "#{current_base_url}/api/v1/events"

    download = open(event_api_link)
    IO.copy_stream(download, "public/#{event_filename}")
  end

  def songs_json
    require 'open-uri'

    song_filename = "#{current_timestamp}-songs.json"
    song_api_link = "#{current_base_url}/api/v1/songs"

    download = open(song_api_link)
    IO.copy_stream(download, "public/#{song_filename}")
  end
end
