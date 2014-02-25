FactoryGirl.define do
  factory :song do
    title "Tick Tock"
    price 1.99
    association :artist
  end
end