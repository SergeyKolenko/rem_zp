require 'rails_helper'

RSpec.describe User, type: :model do
  context 'User model associations' do
    it { expect belong_to(:role) }
    it { expect belong_to(:agency) }
    it { expect have_many(:proposals) }
    it { expect have_many(:agencies) }
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
    let(:user1) { FactoryGirl.create(:user) }
    let(:proposal1) { FactoryGirl.create(:proposal) }
    context 'User db column' do

    end

  end
end



