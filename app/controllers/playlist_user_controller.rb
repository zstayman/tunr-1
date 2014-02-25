class PlaylistUserController < ApplicationController

  def new
    @playlist = Playlist.find_by(id: params[:playlist_id])
    @share = PlaylistUser.new
    
  end

  def create
    @playlist = Playlist.find_by(id: params[:playlist_id])
    @playlist.users << User.where(id: params[:playlist_user][:users])
    redirect_to root_path
  end

end