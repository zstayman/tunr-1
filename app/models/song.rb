class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :purchases

  validates :title, presence: true
  validates :artist, presence: true
  validates :price, presence: true
end