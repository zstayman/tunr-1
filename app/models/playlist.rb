class Playlist < ActiveRecord::Base
  validates :title, presence: true
  has_many :playlist_purchases
  has_many :purchases, through: :playlist_purchases
  has_many :songs, through: :purchases
  has_many :users, through: :playlist_users
  has_many :playlist_users
  
end