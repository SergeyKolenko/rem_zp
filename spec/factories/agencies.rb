FactoryGirl.define do
  factory :agency do
    name Faker::StarWars.planet
    postal_address Faker::Address.secondary_address
    phisical_address Faker::Address.street_address
    approved false
    phone '066-965-26-17'
  end
end

