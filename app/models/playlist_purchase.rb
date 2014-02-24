class PlaylistPurchase < ActiveRecord::Base
  validates :playlist, :purchase, presence: true
  belongs_to :playlist
  belongs_to :purchase
end