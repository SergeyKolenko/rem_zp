FactoryGirl.define do
  factory :district do
    name Faker::StarWars.planet
    code Faker::StarWars.planet.downcase
  end
end


