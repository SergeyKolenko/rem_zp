FactoryGirl.define do
  factory :role do

    factory :super_admin do
      name 'super_admin'
    end

    factory :agency_director do
      name 'agency_director'
    end

    factory :agent do
      name 'agent'
    end

    factory :realtor do
      name 'realtor'
    end

    factory :simple_user do
      name 'simple_user'
    end

    factory :moderator do
      name 'moderator'
    end

  end
end
