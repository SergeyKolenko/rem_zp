FactoryGirl.define do
  factory :user do
    sequence(:email) { |i| "user#{i}@example.org" }
    password 'password1'
    password_confirmation { |user| user.password }
    first_name value Faker::StarWars.planet
    last_name value Faker::StarWars.planet
    role 'agent'
  end
end
