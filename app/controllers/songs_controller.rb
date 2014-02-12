class SongsController < ApplicationController

  before_action(:load_artist)
  before_action(:load_song, { only: [:edit, :update, :destroy] })

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    @song.artist = @artist
    @song.preview_url = #somehow get it from API
    @song.save

    redirect_to artist_path(@artist)
  end

  def edit
  end

  def update
    @song.update(song_params)
    redirect_to artist_path(@artist)
  end

  def destroy
    @song.destroy
    redirect_to artist_path(@artist)
  end

  private

  def load_artist
    return @artist = Artist.find(params[:artist_id])
  end

  def load_song
    return @song = @artist.songs.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :year)
  end

end