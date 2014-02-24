class PlaylistPurchase < ActiveRecord::Base
  belongs_to :playlist
  belongs_to :purchase

  validates :playlist, :purchase, presence: true
  validate :purchase_belongs_to_correct_user

  private

  def purchase_belongs_to_correct_user
    return unless playlist && purchase
    unless playlist.user == purchase.user
      errors.add(:purchase, "This purchase does not belong to the same user as the playlist!")
    end
  end
end