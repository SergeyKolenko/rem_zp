require 'rails_helper'

RSpec.describe City, type: :model do
  context 'model associations' do
    it { expect belong_to(:region) }
    it { expect have_many(:districts) }
    it { expect have_and_belong_to_many(:agencies) }
    it { expect have_many(:proposals) }
  end

  context 'db column' do
    it { expect have_db_column(:name).of_type(:string) }
    it { expect have_db_column(:code).of_type(:string) }
    it { expect have_db_column(:region_id).of_type(:integer) }
  end

  context 'validate column' do
    it { expect validate_presence_of(:name) }
    it { expect validate_presence_of(:code) }
    it { expect validate_uniqueness_of(:code) }
    it { expect validate_presence_of(:region) }
    it { expect validate_uniqueness_of(:region) }
  end

  describe 'validation' do
    let(:region) { FactoryGirl.build(:region) }
    let(:city_valid) { FactoryGirl.build(:city, region: region) }
    let(:city_invalid) { FactoryGirl.build(:city, region_id: '', code: '') }

    it 'is valid with valid attributes' do
      expect(city_valid).to be_valid
    end

    it 'is invalid with blank attributes' do
      expect(city_invalid).not_to be_valid
    end

    context 'with region' do
      let(:region2) { FactoryGirl.build(:region, name: Faker::StarWars.planet, code: 'other_region') }
      let(:city_valid_dup) { FactoryGirl.build(:city, region: region2) }
      let(:city_invalid_dup) { FactoryGirl.build(:region, name: Faker::StarWars.planet, code: 'other_region2') }
      before {city_valid_dup.save}
      before {city_invalid_dup.save}

      it 'be valid with other region' do
        expect(city_valid_dup).to be_valid
      end
    end

  end
end
