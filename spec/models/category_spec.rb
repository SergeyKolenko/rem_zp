require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'model association' do
    it { expect have_many(:proposals) }
  end

  context 'Category db column' do
    it { expect have_db_column(:name).of_type(:string)}
    it { expect have_db_column(:weight).of_type(:integer)}
  end

  describe 'Option validation' do
    let(:category_valid) { FactoryGirl.build(:category, name: 'Дом', weight: 1) }
    let(:category_invalid) { FactoryGirl.build(:category, weight: 0) }

    it 'is valid category with valid attributes' do
      expect(category_valid).to be_valid
    end

    it 'is invalid category with blank attributes' do
      expect(category_invalid).not_to be_valid
    end

    context 'Category validate column' do
      it { expect validate_presence_of(:name) }
      it { expect validate_presence_of(:weight) }
      it { expect validate_numericality_of(:weight).is_greater_than(0) }
      it { expect allow_value(5).for(:weight) }
      it { expect(category_valid).to_not allow_value(0).for(:weight) }
    end
  end
end
