class PlaylistPurchase < ActiveRecord::Base
<<<<<<< HEAD
  validates :playlist, :purchase, presence: true
  validate :song_belongs_to_user, on: :create
  belongs_to :playlist
  belongs_to :purchase

  def song_belongs_to_user
    if Playlist.find_by(id: self.playlist_id) != Purchase.find_by(id: self.purchase_id)
      errors.add(:song, "You don't own that song")
=======
  belongs_to :playlist
  belongs_to :purchase

  validates :playlist, :purchase, presence: true
  validate :purchase_belongs_to_correct_user

  private

  def purchase_belongs_to_correct_user
    return unless playlist && purchase
    unless playlist.user == purchase.user
      errors.add(:purchase, "This purchase does not belong to the same user as the playlist!")
>>>>>>> af29d1d0ff3d61c9102997a0e7c511b0094624d5
    end
  end
end