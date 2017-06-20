require 'rails_helper'

RSpec.describe User, type: :model do
  # context 'User model associations' do
  #   it { expect belong_to(:role) }
  #   it { expect belong_to(:agency) }
  #   it { expect have_many(:proposals) }
  #   it { expect have_many(:agencies) }
  # end
  #
  # context 'User db column' do
  #   it { expect have_db_column(:email).of_type(:string) }
  #   it { expect have_db_column(:first_name).of_type(:string) }
  #   it { expect have_db_column(:last_name).of_type(:string) }
  #   it { expect have_db_column(:role_id).of_type(:integer) }
  #   it { expect have_db_column(:agency_id).of_type(:integer) }
  #   it { expect have_db_column(:phone).of_type(:string) }
  # end

  describe 'User validation' do
    # let(:role1) { FactoryGirl.create(:agent) }
    # let(:agency1) { FactoryGirl.create(:agency) }
    # let(:user_valid) { FactoryGirl.create(:user, role: role1, agency: agency1) }
    let(:user_valid) { FactoryGirl.build(:user) }
    let(:user_invalid) { FactoryGirl.build(:user,last_name: '') }

    it 'User is valid with valid attributes' do
      p user_valid
      expect(user_valid).to be_valid
    end

    it 'User is invalid with blank attributes' do
      expect(user_invalid).not_to be_valid
    end

  end
end



