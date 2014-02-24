class SongsController < ApplicationController

  before_action(:load_artist, only: [:new, :create] )
  before_action(:load_song, { only: [:edit, :update, :destroy] })

  def index
    @user = User.find_by(id: params[:user_id])
    @songs = @user.songs
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    @song.artist = @artist
    @song.preview_url = get_preview_url(@artist.name, @song.title)
    @song.save

    redirect_to artist_path(@artist)
  end

  def edit
  end

  def update
    @song.update(song_params)
    redirect_to artist_path(@song.artist)
  end

  def destroy
    @song.destroy
    redirect_to artist_path(@song.artist)
  end

  private

  def load_artist
    return @artist = Artist.find_by(id: params[:artist_id])
  end

  def load_song
    return @song = Song.find_by(id: params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :year)
  end

  def get_preview_url(artist, song)
    artist = artist.gsub(" ", "+")
    song = song.gsub(" ", "+")
    from_itunes = HTTParty.get("http://itunes.apple.com/search?term=#{artist}+#{song}&media=music&entity=musicTrack&limit=1")
    from_itunes_as_hash = JSON(from_itunes)
    return from_itunes_as_hash["results"][0]["previewUrl"]
  end
end