FactoryGirl.define do
  factory :option_value do
    value {Faker::Name.name}
    unir {Faker::Name.name}
  end
end
