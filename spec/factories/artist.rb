FactoryGirl.define do
  factory :artist do
<<<<<<< HEAD
    name "kesha2"
    photo_url "www.google.com"
=======
    name { Faker::Name.name }
    photo_url "http://google.com"
  end
>>>>>>> 153844e3a5eaef553899a39f2e6d558477c1cea8
end