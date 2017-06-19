require 'rails_helper'

RSpec.describe Option, type: :model do
  let(:option_valid) { FactoryGirl.build(:square) }
  let(:option_invalid) { FactoryGirl.build(:option, name: '') }
  let(:option_value1) { FactoryGirl.create(:option_value, option: option_valid) }
  let(:category1) { FactoryGirl.create(:category, option: option_valid) }

  it 'is valid option with valid attributes' do
    p option1
    expect(option_valid).to be_valid
  end

  it 'is invalid option with blank attributes' do
    expect(option_invalid).not_to be_valid
  end

  context 'Option model connection' do
    it { expect have_many(:option_values) }
    it { expect have_and_belong_to_many(:categories) }
  end

  context 'Option db column' do
    it { expect have_db_column(:name).of_type(:string)}
  end

  context 'Option validate column' do
    it { expect validate_length_of(:name).is_at_least(2).is_at_most(20) }
  end
end