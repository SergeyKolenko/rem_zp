require 'rails_helper'

RSpec.describe Role, type: :model do
  context 'model connection' do
    it { expect have_many(:users) }
  end

  context 'Role db column' do
    it { expect have_db_column(:name).of_type(:string) }
    it { expect validate_presence_of(:name) }
  end

  describe 'Proposal validation' do
    let(:role_valid) { FactoryGirl.build(:agent) }
    let(:role_invalid) { FactoryGirl.build(:role, name: '') }

    it 'is valid Role with valid attributes' do
      p role_valid
      expect(role_valid).to be_valid
    end

    it 'is invalid Role with blank attributes' do
      expect(role_invalid).not_to be_valid
    end
  end
end