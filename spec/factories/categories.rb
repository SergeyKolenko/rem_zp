FactoryGirl.define do
  factory :category do
    %w(Квартира Дом Гараж Дача Участок Офис Бизнес).each do |c_name|
      factory c_name.downcase do
        name c_name
      end
    end
  end
end