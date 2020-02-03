module Api
  module V1
    class EventsController < ApplicationController

      def index
        events = EventSerializer.new(Event.all).serializable_hash
        event_data = {}
        details_data = []

        events[:data].each do |d|
          event_data['id'] = d[:id]
          event_data['title'] = d[:attributes][:title]
          event_data['by'] = d[:attributes][:by]
          details = d[:attributes][:details].to_hash

          details[:data].each do |detail|
            data = {}
            data['id'] = detail[:attributes][:id]
            data['title'] = detail[:attributes][:title]
            selected_songs_data = []

            selected = detail[:relationships][:selected_song].to_hash
            selected[:data].each do |sel|
              data_sel = {}
              data_sel['id'] = sel[:id]

              # Query DB
              selected_song = SelectedSong.find_by_id(sel[:id])
              data_sel['song_id'] = selected_song.song.id
              data_sel['title'] = selected_song.song.title
              data_sel['artist'] = selected_song.song.artist
              data_sel['lyrics_and_chords'] = selected_song.song.lyrics_and_chords

              selected_songs_data << data_sel

            end

            data['selected_songs'] = selected_songs_data
            details_data << data

            event_data['details'] = details_data
          end
        end

        render json: event_data
      end

    end
  end
end