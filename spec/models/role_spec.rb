require 'rails_helper'

RSpec.describe Role, type: :model do
  context 'model associations' do
    it { expect have_many(:users) }
  end

  context 'db column' do
    it { expect have_db_column(:name).of_type(:string) }
  end

  describe 'validation' do
    let(:role_valid) { FactoryGirl.build(:agent) }
    let(:role_invalid) { FactoryGirl.build(:role, name: '') }


    it 'is valid Role with valid attributes' do
      expect(role_valid).to be_valid
    end

    it 'is invalid with blank attributes' do
      expect(role_invalid).not_to be_valid
    end

    context 'validate_presence_of name' do
      it { expect validate_presence_of(:name) }

    it 'is invalid with wrong name' do
      role_invalid.name = 'zxcv'
      expect(role_invalid).not_to be_valid
    end
  end

  describe 'static methods' do
    before(:all) {create_roles}

    Role::NAMES.each do |name|
      it "Role.#{name} must be object with #{name}" do
        expect(Role.send(name)).to eq(Role.find_by_name(name))
        end
      end
    end

  end
end