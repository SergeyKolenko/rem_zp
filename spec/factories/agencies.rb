FactoryGirl.define do
  factory :agency do
    name Faker::StarWars.planet
    postal_address Faker::Address.secondary_address
    phisical_address Faker::Address.street_address
    approved true
    # region
    # director
    # user
    # city
    # district
    phone Faker::Number.number(10)
  end
end

