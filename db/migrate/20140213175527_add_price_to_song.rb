class AddPriceToSong < ActiveRecord::Migration
  def change
    change_table(:songs) do |t|
      t.decimal(:price, default: 1.99)
    end
  end
end
