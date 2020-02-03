module Api
  module V1
    class SongsController < ApplicationController

      def index
        render json: SongSerializer.new(Song.all)
      end

    end
  end
end