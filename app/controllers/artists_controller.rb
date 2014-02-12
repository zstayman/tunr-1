class ArtistsController < ApplicationController

  before_action :load_artist, only: [:show, :edit, :update, :destroy]

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.create(artist_params)
    redirect_to artists_path
  end

  def index
    @artists = Artist.all
  end

  def show
    @songs = @artist.songs.all
  end

  def edit
  end

  def update
    @artist.update(artist_params)
    redirect_to artists_path
  end

  def destroy
    @artist.destroy
    redirect_to artists_path
  end

  private

  def load_artist
    return @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :genre, :photo_url)
  end

end