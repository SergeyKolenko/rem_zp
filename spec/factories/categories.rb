FactoryGirl.define do
  factory :category do
    {
        flat:     'Flat',
        house:    'House',
        garage:   'Garage',
        dacha:    'Cottage',
        area:     'Area',
        office:   'Office',
        business: 'Business'
    }.each do |code, name|
      factory code.downcase do
        name name
        code code
        weight 1
      end
    end
  end
end
