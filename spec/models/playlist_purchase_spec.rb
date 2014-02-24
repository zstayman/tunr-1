require 'spec_helper'

describe PlaylistPurchase do
  it { should validate_presence_of(:playlist) }
  it { should belong_to(:playlist) }
  it { should validate_presence_of(:purchase) }
  it { should belong_to(:purchase) }

  # Test to make sure that I can only add purchases which belong to the
  # same user as the playlist

  let(:user) do
    User.create!({
      email: "j@k.co",
      password: "jeff",
      password_confirmation: "jeff",
      first_name: "Jeff",
      last_name: "K",
      dob: Date.today,
      balance: 100.00
    }) 
  end

  let(:some_other_user) do
    User.create!({
      email: "k@k.co",
      password: "jeff",
      password_confirmation: "jeff",
      first_name: "Jeff",
      last_name: "K",
      dob: Date.today,
      balance: 100.00
    }) 
  end

  let(:playlist) { Playlist.create!(title: "Sweet Beats", user: user)}

  let(:kesha) do
    Artist.create!({
      name: "Ke$ha",
      photo_url: "http://placekitten.com/g/200/200"
    })
  end

  let(:tick_tock) do
    Song.create!({
      title: "Tick Tock",
      price: 1.99,
      artist: kesha
    })
  end

  let(:love_is_my_drug) do
    Song.create!({
      title: "Love is My Drug",
      price: 0.99,
      artist: kesha
    })
  end

  let(:purchase_tick_tock) { Purchase.create!(user: user, song: tick_tock) }
  let(:purchase_love_drug) { Purchase.create!(user: some_other_user, song: love_is_my_drug) }

  it "doesn't add songs which the user does not own" do
    PlaylistPurchase.create(playlist: playlist, purchase: purchase_tick_tock)
    expect(playlist.purchases).to include(purchase_tick_tock)

    PlaylistPurchase.create(playlist: playlist, purchase: purchase_love_drug)
    expect(playlist.purchases).to_not include(purchase_love_drug)
  end
end