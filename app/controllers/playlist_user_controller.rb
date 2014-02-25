class PlaylistUserController < ApplicationController

  def new
    @user = User.new
    @share = PlaylistUser.new
    
  end

  def create
    @playlist.users << User.where(id: params[:playlist_user][:users])
    redirect_to root_path
  end

end