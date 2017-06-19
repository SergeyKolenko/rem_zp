FactoryGirl.define do
  factory :proposal do
    title "MyString"
    description Faker::Lorem.characters(101)
    price 1.5
    promo_price 1.5
    currency "MyString"
    street "MyString"
    house_number "MyString"
    approved false
    author nil
    district nil
    # region_id 1
  end
end
