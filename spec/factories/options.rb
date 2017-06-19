FactoryGirl.define do
  factory :option do

    factory :square do
      name 'Square'
      unit 'm<sup>2</sup>'

      factory :square_avg do
        name 'Square avg'
      end

      factory :square_kitchen do
        name 'Square kitchen'
      end
    end

    factory :volume do
      name 'volume'
      unit 'шт'

      factory :counter do
        name 'Counter'
      end
    end

  end
end
