require 'rails_helper'

RSpec.describe City, type: :model do
  let(:city1) { FactoryGirl.build(:city, region_id: 7) }
  let(:city2) { FactoryGirl.build(:city, region_id: '') }

  it 'is valid category with valid attributes' do
    expect(city1).to be_valid
  end

  it 'is invalid category with blank attributes' do
    expect(city2).not_to be_valid
  end

  context 'model connection' do
    it { expect belong_to(:region) }
    it { expect have_many(:districts) }
    it { expect have_and_belong_to_many(:agencies) }
    it { expect have_many(:proposals) }
  end

  context 'City db column' do
    it { expect have_db_column(:name).of_type(:string) }
    it { expect have_db_column(:region_id).of_type(:integer) }
  end
end
