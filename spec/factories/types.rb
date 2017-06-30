FactoryGirl.define do
  factory :type do
    name Faker::StarWars.planet
    code Faker::StarWars.planet.downcase
  end
end