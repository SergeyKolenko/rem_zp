FactoryGirl.define do
  factory :option do

    factory :square do
      code 'square'
      name 'Square'
      unit 'm<sup>2</sup>'

      factory :square_avg do
        name 'Square avg'
        code 'square_avg'
      end

      factory :square_kitchen do
        name 'Square kitchen'
        code 'square_kitchen'
      end
    end

    factory :volume do
      name 'volume'
      code 'volume'
      unit 'ct'

      factory :counter do
        name 'Counter'
        code 'counter'
      end
    end

  end
end
