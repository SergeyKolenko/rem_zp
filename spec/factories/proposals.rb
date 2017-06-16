FactoryGirl.define do
  factory :proposal do
    title "MyString"
    description
    price 1.5
    promo_price 1.5
    currency "MyString"
    street "MyString"
    house_number "MyString"
    approved false
    author nil
    district nil
    city
    region_id 1
  end
end
