FactoryGirl.define do
  factory :region do
    name Faker::Lorem.characters(10)
  end
end
