require 'rails_helper'

RSpec.describe User, type: :model do
  context 'User model connection' do
    it { should belong_to(:role) }
    it { should belong_to(:agency) }
    it { should have_many(:proposals) }
    it { should have_one(:owned_agency) }
  end

  context 'User db column' do
    it { expect have_db_column(:email).of_type(:string) }
    it { expect have_db_column(:first_name).of_type(:string) }
    it { expect have_db_column(:last_name).of_type(:string) }
    it { expect have_db_column(:role_id).of_type(:integer) }
    it { expect have_db_column(:agency_id).of_type(:integer) }
    it { expect have_db_column(:phone).of_type(:string) }
  end

  describe 'User validation' do
    let(:role1) { FactoryGirl.build(:simple_user) }
    let(:user_valid) { FactoryGirl.build(:user, role: role1) }
    let(:user_invalid) { FactoryGirl.build(:user, phone: '', role: role1) }
    let(:user_invalid_phone) { FactoryGirl.build(:user, phone:'0875567778', role: role1) }

    it 'User is valid with valid attributes' do
      expect(user_valid).to be_valid
    end

    it 'User is invalid with blank attributes' do
      expect(user_invalid).not_to be_valid
    end

    it 'User is invalid with invalid phone attributes' do
      expect(user_invalid_phone).not_to be_valid
    end

    context 'User basic validation presense_of' do
      it { expect validate_presence_of(:first_name) }
      it { expect validate_presence_of(:last_name) }
      it { expect validate_presence_of(:role) }
    end
  end
end



