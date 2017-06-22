FactoryGirl.define do
  factory :agency do
    name Faker::StarWars.planet
    postal_address Faker::Address.secondary_address
    phisical_address Faker::Address.street_address
<<<<<<< HEAD
    approved false
    phone '066-965-26-17'
=======
    phone '066-965-26-17'
    approved true

    trait :not_approved do
      approved false
    end

>>>>>>> 018085c273841cdf29645517e3125d40d12c3dc4
  end
end

