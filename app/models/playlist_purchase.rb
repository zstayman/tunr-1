class PlaylistPurchase < ActiveRecord::Base
  validates :playlist, :purchase, presence: true
  validate :song_belongs_to_user, on: :create
  belongs_to :playlist
  belongs_to :purchase

  def song_belongs_to_user
    if Playlist.find_by(id: self.playlist_id) != Purchase.find_by(id: self.purchase_id)
      errors.add(:song, "You don't own that song")
    end
  end
end