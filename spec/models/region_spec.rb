require 'rails_helper'

RSpec.describe Region, type: :model do
  context 'model associations' do
    it { expect have_many(:cities) }
    it { expect have_many(:proposals) }
    it { expect have_and_belong_to_many(:agencies) }
  end

  context 'db column' do
    it { expect have_db_column(:name).of_type(:string)}
  end

  context 'basic validate column' do
    it { expect validate_presence_of(:name) }
    it { expect validate_uniqueness_of(:name) }
  end

  describe 'validation' do
    let(:region_valid) { FactoryGirl.build(:region) }
    let(:region_invalid) { FactoryGirl.build(:region, name: '') }

    it 'is valid with valid attributes' do
      expect(region_valid).to be_valid
    end

    it 'is invalid with blank attributes' do
      expect(region_invalid).not_to be_valid
    end
  end
end
