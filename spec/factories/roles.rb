FactoryGirl.define do
  factory :role do

    factory :super_admin do
      name 'super_admin'
    end

    factory :moderator do
      name 'moderator'
    end

  end
end
