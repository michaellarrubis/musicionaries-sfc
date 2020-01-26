class PagesController < ApplicationController
  def index
    @songs = Song.all.limit(10)
    @events = Event.all.limit(3)
  end
end
