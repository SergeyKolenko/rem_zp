FactoryGirl.define do
  factory :agency do
    name Faker::StarWars.planet
    postal_address Faker::Address.secondary_address
    phisical_address Faker::Address.street_address

    trait :approved_false do
      approved false
    end

    trait :approved_true do
      approved true
    end

    trait :valid_phone do
      phone '066-965-26-17'
    end
    trait :invalid_phone do
      phone '8669652617'
    end
  end
end

