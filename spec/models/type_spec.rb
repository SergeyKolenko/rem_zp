require 'rails_helper'

RSpec.describe Type, type: :model do
  context 'Type model connection' do
    it { expect have_and_belong_to_many(:proposals) }
  end

  context 'Type db column' do
    it { expect have_db_column(:name).of_type(:string) }
  end

  context 'Option validate column' do
    it { expect validate_presence_of(:name) }
    it { expect validate_uniqueness_of(:name) }
  end

  describe 'Type validation' do
    let(:type_valid) { FactoryGirl.build(:type) }
    let(:type_invalid) { FactoryGirl.build(:type, name: '') }
    let(:type_invalid_not_uniq_name) { FactoryGirl.create(:type, name:'String') }

    it 'Type is valid with valid attributes' do
      expect(type_valid).to be_valid
    end

    it 'Type is invalid with blank attributes' do
      expect(type_invalid).not_to be_valid
    end

  end
end
