require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category_valid) { FactoryGirl.build(:category, weight: 1) }
  let(:category_invalid) { FactoryGirl.build(:category, weight: 0) }

  it 'is valid category with valid attributes' do
    expect(category_valid).to be_valid
  end

  it 'is invalid category with blank attributes' do
    expect(category_invalid).not_to be_valid
  end

  context 'model association' do
    it { expect have_many(:proposals) }
  end

  context 'Category db column' do
    it { expect have_db_column(:name).of_type(:string)}
    it { expect have_db_column(:weight).of_type(:integer)}
  end

  context 'Category validate column' do
    it { expect validate_numericality_of(:weight).is_greater_than(0) }
  end

end
