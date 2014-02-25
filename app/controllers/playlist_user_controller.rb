class PlaylistUserController < ApplicationController

  def new
    @playlist = Playlist.find_by(id: params[:playlist_id])
    @share = PlaylistUser.new({
      
      })
  end

  def create
  end

end