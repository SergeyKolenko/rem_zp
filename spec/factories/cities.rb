FactoryGirl.define do
  factory :city do
    name Faker::StarWars.planet
    code Faker::StarWars.planet.downcase
  end
end


