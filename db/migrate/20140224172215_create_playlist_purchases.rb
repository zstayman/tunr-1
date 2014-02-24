class CreatePlaylistPurchases < ActiveRecord::Migration
  def change
    create_table :playlist_purchases do |t|
      t.references :playlist
      t.references :purchase
    end
  end
end
