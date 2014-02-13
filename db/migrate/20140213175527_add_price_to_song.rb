class AddPriceToSong < ActiveRecord::Migration
  def change
    change_table(:songs) do |t|
      t.decimal(:price)
    end
  end
end
