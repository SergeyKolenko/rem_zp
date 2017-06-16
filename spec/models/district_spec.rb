require 'rails_helper'

RSpec.describe District, type: :model do
  let(:district1) { FactoryGirl.build(:district) }
  let(:district2) { FactoryGirl.build(:district, city_id: '') }

  it 'is valid category with valid attributes' do
    p district1
    expect(district1).to be_valid
  end

  it 'is invalid category with blank attributes' do
    p district2
    expect(district2).not_to be_valid
  end

  context 'District model associations' do
    it { expect belong_to(:city) }
    it { expect have_and_belong_to_many(:agencies) }
    it { expect have_many(:proposals) }
  end

  context 'District db column' do
    it { expect have_db_column(:name).of_type(:string) }
    it { expect have_db_column(:city_id).of_type(:integer) }
  end
end
