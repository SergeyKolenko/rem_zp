FactoryGirl.define do
  factory :user do
    sequence(:email) { |i| "user#{i}@example.org" }
    password 'password1'
    password_confirmation { |user| user.password }
    first_name Faker::StarWars.planet
    last_name Faker::StarWars.planet
    phone '066-965-26-17'
  end
end
