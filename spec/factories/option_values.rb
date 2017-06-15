FactoryGirl.define do
  factory :option_value do
    value "MyString"
    proposal_id
    option_id
  end
end
