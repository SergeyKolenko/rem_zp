FactoryGirl.define do
  factory :proposal do
    title Faker::Lorem.characters(6)
    description Faker::Lorem.characters(101)
    price Faker::Number.decimal(2)
    promo_price Faker::Number.decimal(2)
    currency Faker::Lorem.characters

    trait :street_nil do
      street nil
    end
    trait :street_valid do
      street Faker::Lorem.characters
    end
    trait :street_invalid do
      street Faker::Lorem.characters(2)
    end

    house_number Faker::Number.number(2)
    approved false
    district nil
  end
end
