require 'rails_helper'

RSpec.describe City, type: :model do
  context 'model associations' do
    it { expect belong_to(:region) }
    it { expect have_many(:districts) }
    it { expect have_and_belong_to_many(:agencies) }
    it { expect have_many(:proposals) }
  end

  context 'City db column' do
    it { expect have_db_column(:name).of_type(:string) }
    it { expect have_db_column(:region_id).of_type(:integer) }
    it { expect validate_uniqueness_of(:region) }
  end

  context 'City validate column' do
    it { expect validate_presence_of(:name) }
    it { expect validate_presence_of(:region) }
  end

  describe 'City validation' do
    let(:region1) { FactoryGirl.build(:region, name: Faker::StarWars.planet) }
    let(:city_valid) { FactoryGirl.build(:city, region: region1) }
    let(:city_invalid) { FactoryGirl.build(:city, region_id: '') }

    it 'City is valid with valid attributes' do
      expect(city_valid).to be_valid
    end

    it 'City is invalid with blank attributes' do
      expect(city_invalid).not_to be_valid
    end

    context 'City with region' do
      let(:region2) { FactoryGirl.build(:region, name: Faker::StarWars.planet) }
      let(:city_valid_dup) { FactoryGirl.build(:city, region: region2) }
      let(:city_invalid_dup) { FactoryGirl.build(:region, name: Faker::StarWars.planet) }
      before {city_valid_dup.save}
      before {city_invalid_dup.save}

      it 'City be valid with other region' do
        expect(city_valid_dup).to be_valid
      end
    end

  end
end
