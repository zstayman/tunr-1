require 'spec_helper'

describe "a user can share a playlist" do
  let(:creator) {FactoryGirl.create(:user)}

  let(:shared) do 
    User.create!({
      email: "jim@k.co",
      password: "jeff",
      password_confirmation: "jeff",
      first_name: "Jim",
      last_name: "K",
      dob: Date.today,
      balance: 100.00
    }) 
  end

  let(:not_shared) do 
    User.create!({
      email: "joe@k.co",
      password: "jeff",
      password_confirmation: "jeff",
      first_name: "Joe",
      last_name: "K",
      dob: Date.today,
      balance: 100.00
    }) 
  end

  let(:playlist) do
    Playlist.create!({
      title: "Test"
      })
  end

  it "shares a playlist" do
    # setup
    
    login(creator)
    playlist
    creator.playlists << playlist
    shared
    not_shared
    
    # Workflow
    visit user_path(creator)
    
    click_link "Share Playlist"
    save_and_open_page
    select shared.first_name, from: "playlist_user_user_id"
    within "#playlist_user_user_id" do
      expect(page).to have_content shared.first_name
    end
   
    click_button "Share"
    visit playlist_path(playlist)
    click_link "Log Out Jeff!"
  end

  def login(user)
    visit "/login"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log in!"
  end

end