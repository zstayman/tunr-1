FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "j#{n}@k.co"}
    first_name "Jeff"
    last_name "K"
    dob Date.today
    balance 10.00
  end
end