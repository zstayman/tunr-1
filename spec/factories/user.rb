FactoryGirl.define do
  factory :user do
<<<<<<< HEAD
    sequence(:email) {|n| "j#{n}@k.co"}
    first_name "Jeff"
    last_name "K"
=======
    email { Faker::Internet.email } 
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password "jeff"
    password_confirmation "jeff"
>>>>>>> 153844e3a5eaef553899a39f2e6d558477c1cea8
    dob Date.today
    balance 10.00
  end
end