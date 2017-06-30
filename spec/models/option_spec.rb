require 'rails_helper'

RSpec.describe Option, type: :model do
  context 'model associations' do
    it { expect have_many(:option_values) }
    it { expect have_and_belong_to_many(:categories) }
  end

  context 'db column' do
    it { expect have_db_column(:name).of_type(:string)}
    it { expect have_db_column(:unit).of_type(:string)}
    it { expect have_db_column(:code).of_type(:string)}
  end

  context 'Option validate column' do
    it { expect validate_presence_of(:option_value) }
    it { expect validate_presence_of(:category) }
    it { expect validate_presence_of(:code) }
    it { expect validate_uniqueness_of(:code) }
    it { expect validate_length_of(:name).is_at_least(2).is_at_most(20) }
    it { expect allow_value("Square").for(:name) }
  end

  describe 'validation' do
    let(:option_valid) { FactoryGirl.create(:square) }
    let(:option_invalid) { FactoryGirl.build(:option, name: '', code: '') }

    it 'is valid option with valid attributes' do
      expect(option_valid).to be_valid
    end

    it 'is invalid option with blank attributes' do
      expect(option_invalid).not_to be_valid
    end

    it 'is invalid with name.length < 2' do
      option_invalid.name = 'O'
      expect(option_invalid).not_to be_valid
      option_invalid.name = ''
      expect(option_invalid).not_to be_valid
    end

    it 'is invalid with name.length > 20' do
      option_invalid.name = Faker::Lorem.characters(21)
      expect(option_invalid).not_to be_valid
    end

  end
end