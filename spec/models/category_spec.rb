require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'model association' do
    it { expect have_many(:proposals) }
    it { expect have_and_belong_to_many(:options) }
  end

  context 'db column' do
    it { expect have_db_column(:name).of_type(:string)}
    it { expect have_db_column(:code).of_type(:string)}
    it { expect have_db_column(:weight).of_type(:integer)}
  end

  describe 'validation' do
    let(:category_valid) { FactoryGirl.build(:house) }
    let(:category_invalid) { FactoryGirl.build(:category, weight: 0, code: '') }

    it 'is valid category with valid attributes' do
      expect(category_valid).to be_valid
    end

    it 'is invalid category with blank attributes' do
      expect(category_invalid).not_to be_valid
    end

    context 'validate column' do
      it { expect validate_presence_of(:name) }
      it { expect validate_presence_of(:code) }
      it { expect validate_uniqueness_of(:code) }
      it { expect validate_presence_of(:weight) }
      it { expect validate_numericality_of(:weight).is_greater_than(0) }
      it { expect allow_value(5).for(:weight) }
      it { expect(category_valid).to_not allow_value(0).for(:weight) }
    end
  end
end
