require 'rails_helper'

RSpec.describe District, type: :model do
  context 'District model associations' do
    it { expect belong_to(:city) }
    it { expect have_and_belong_to_many(:agencies) }
    it { expect have_many(:proposals) }
  end

  context 'District db column' do
    it { expect have_db_column(:name).of_type(:string) }
    it { expect have_db_column(:city_id).of_type(:integer) }
  end

  context 'City validate column' do
    it { expect validate_presence_of(:name) }
    it { expect validate_presence_of(:city) }
  end

  describe 'Option validation' do
    let(:city1) { FactoryGirl.build(:city) }
    let(:district_valid) { FactoryGirl.build(:district, city: city1) }
    let(:district_invalid) { FactoryGirl.build(:district, city_id: '') }

    it 'is valid District with valid attributes' do
      expect(district_valid).to be_valid
    end

    it 'is invalid District with blank attributes' do
      expect(district_invalid).not_to be_valid
    end
  end
end
