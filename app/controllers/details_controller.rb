class DetailsController < ApplicationController
  before_action :set_event, :set_songs
  before_action :set_detail, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]
  include ApplicationHelper

  def index
    @details = @event.details.all
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "#{anchor_text(@detail.title)}-songs",
        title: "#{anchor_text(@detail.title)}-songs",
        page_size: 'A4',
        template: "songs/_song-content.html.erb",
        layout: "pdf.html",
        lowquality: true,
        zoom: 1,
        dpi: 75
      end
    end
  end

  def new
    @detail = @event.details.build
  end

  def edit
  end

  def create
    @detail = @event.details.build(detail_params)

    respond_to do |format|
      if @detail.save
        format.html { redirect_to event_detail_path(@event, @detail), notice: 'Detail was successfully created.' }
        format.json { render :show, status: :created, location: @detail }
      else
        format.html { render :new }
        format.json { render json: @detail.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @detail.update(detail_params)
        format.html { redirect_to event_detail_path(@event, @detail), notice: 'Detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @detail }
      else
        format.html { render :edit }
        format.json { render json: @detail.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @detail.destroy
    respond_to do |format|
      format.html { redirect_to event_path(@event), notice: 'Detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_event
      @event = Event.find(params[:event_id])
    end

    def set_songs
      @songs = Song.all.order(:title)
    end

    def set_detail
      @detail = @event.details.find(params[:id])
      @detail_songs = @detail.selected_songs
    end

    def detail_params
      params.require(:detail).permit(:event_id, :title, selected_songs_attributes:[:song_id, :_destroy, :id])
    end
end
