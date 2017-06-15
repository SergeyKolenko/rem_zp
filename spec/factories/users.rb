FactoryGirl.define do
  factory :user do
    sequence(:email) { |i| "user#{i}@example.org" }
    password 'password1'
    password_confirmation { |user| user.password }
    first_name 'James'
    last_name 'Bond'
    agency :agency_1
    author_id 1
    role :simple_user
  end
end
