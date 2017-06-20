FactoryGirl.define do
  factory :user do
    sequence(:email) { |i| "user#{i}@example.org" }
    password 'password1'
    password_confirmation { |user| user.password }
    first_name Faker::StarWars.planet
    last_name Faker::StarWars.planet
    trait :valid_phone do
      phone '066-965-26-17'
    end
    trait :invalid_phone do
      phone '8669652617'
    end
  end
end
