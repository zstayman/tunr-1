class Purchase < ActiveRecord::Base
  belongs_to :song
  belongs_to :user

  validates :user, :song, presence: true
end
