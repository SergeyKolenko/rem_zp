FactoryGirl.define do
  factory :proposal do
    title Faker::Lorem.characters(21)
    description Faker::Lorem.characters(101)
    price 1.5
    promo_price 1.5
    currency "MyString"
    street nil
    house_number "MyString"
    approved false
    district nil
  end
end
