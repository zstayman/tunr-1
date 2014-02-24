require 'spec_helper'

describe PlaylistPurchase do
  it { should validate_presence_of(:playlist) }
  it { should belong_to(:playlist) }
  it { should validate_presence_of(:purchase) }
  it { should belong_to(:purchase) }

  let(:user) {User.create(email: "z@st.co", first_name: "Zack", last_name: "Stayman", dob: Date.today, balance: 0, password: "test", password_confirmation: "test")}
  let(:playlist) {Playlist.create(user_id: user.id)}
  let(:artist) {Artist.create(name: "Beatles", photo_url: "http://placekitten.com/600/200")}
  let(:song) {Song.create(title: "Yellow Submarine", artist: artist, price: 1.99)}
  let(:purchasea) 

  it "should ensure that the purchase belongs to the same user as the playlist" do
    user.songs << song
    
    songa = Song.create(title: "While My Guitar Gently Weeps", artist: artist, price: 1.99)
    usera = User.create(email: "z@s.co", first_name: "Z", last_name: "S", dob: Date.today, balance: 0, password: "test", password_confirmation: "test")
    
    usera.songs << songa
    PlaylistPurchase.create(playlist: playlist, purchase: )
    playlist.purchases << Purchase.first
    binding.pry
    expect(playlist.purchases).to include(Purchase.first)
    expect(playlist.purchases).not_to include(Purchase.last)
  end
end