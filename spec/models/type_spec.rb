require 'rails_helper'

RSpec.describe Type, type: :model do
  context 'model associations' do
    it { expect have_and_belong_to_many(:proposals) }
  end

  context 'db column' do
    it { expect have_db_column(:name).of_type(:string) }
    it { expect have_db_column(:code).of_type(:string) }
  end

  context 'Type validate column' do
    it { expect validate_presence_of(:name) }
    it { expect validate_presence_of(:code) }
    it { expect validate_uniqueness_of(:code) }
  end

  describe 'validation' do
    let(:type_valid) { FactoryGirl.create(:type, code: 'type_code') }
    let(:type_invalid) { FactoryGirl.build(:type, name: '', code: '') }

    it 'is valid with valid attributes' do
      expect(type_valid).to be_valid
    end

    it 'is invalid with blank attributes' do
      expect(type_invalid).not_to be_valid
    end
  end
end
