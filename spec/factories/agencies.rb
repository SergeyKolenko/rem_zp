FactoryGirl.define do
  factory :agency do
    name 'Example'
    sequence(:agency) { |i| "user#{i}" }
    postal_address 'WEfrsfsf 5'
    phisical_address 'svrvsav avdv'
    region
    user
    city
    district
    approved true
    phone '08005044440'
    derector
  end
end

