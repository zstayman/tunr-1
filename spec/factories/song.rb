FactoryGirl.define do
  factory :song do
<<<<<<< HEAD
    title "Tick Tock"
=======
    title { Faker::Lorem.words(3).join(" ") }
>>>>>>> 153844e3a5eaef553899a39f2e6d558477c1cea8
    price 1.99
    association :artist
  end
end