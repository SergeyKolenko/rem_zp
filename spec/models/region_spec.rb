require 'rails_helper'

RSpec.describe Region, type: :model do
  context 'Region model connection' do
    it { expect have_many(:cities) }
    it { expect have_many(:proposals) }
    it { expect have_and_belong_to_many(:agencies) }
  end

  context 'Region db column' do
    it { expect have_db_column(:name).of_type(:string)}
  end

  describe 'Region validation' do
    let(:region_valid) { FactoryGirl.build(:region) }
    let(:region_invalid) { FactoryGirl.build(:region, name: '') }

    it 'is valid Region with valid attributes' do
      expect(region_valid).to be_valid
    end

    it 'is invalid Region with blank attributes' do
      expect(region_invalid).not_to be_valid
    end

    context 'Region basic validate column' do
      it { expect validate_presence_of(:name) }
      it { expect validate_uniqueness_of(:name) }
    end
  end
end
