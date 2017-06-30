FactoryGirl.define do
  factory :region do
    name Faker::StarWars.planet
    code Faker::StarWars.planet.downcase
  end
end
