FactoryGirl.define do
  factory :proposal do
    trait :title_valid do
      title Faker::Lorem.characters(6)
    end
    trait :title_invalid do
      title Faker::Lorem.characters(51)
    end

    trait :description_valid do
      description Faker::Lorem.characters(101)
    end
    trait :description_invalid do
      description Faker::Lorem.characters(10)
    end

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

    trait :approved_false do
      approved false
    end

    trait :approved_true do
      approved true
    end

    trait :district_nil do
      district nil
    end
  end
end
