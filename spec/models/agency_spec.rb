require 'rails_helper'

RSpec.describe Agency, type: :model do

  context 'Agency model associations' do
    it { expect belong_to(:director) }
    it { expect have_many(:users) }
    it { expect have_and_belong_to_many(:cities) }
    it { expect have_and_belong_to_many(:regions) }
    it { expect have_and_belong_to_many(:districts) }
  end

  context 'Agency db column' do
    it { expect have_db_column(:approved).of_type(:boolean) }
    it { expect have_db_column(:description).of_type(:text) }
    it { expect have_db_column(:director_id).of_type(:integer) }
    it { expect have_db_column(:name).of_type(:string) }
    it { expect have_db_column(:phone).of_type(:string) }
    it { expect have_db_column(:postal_address).of_type(:string) }
    it { expect have_db_column(:phisical_address).of_type(:string) }
  end

  # describe 'Agency validation' do
  #   let(:role1) { FactoryGirl.build(:agency_director) }
  #   let(:user1) { FactoryGirl.build(:user, role: role1) }
  #   let(:agency_valid) { FactoryGirl.build(:agency, director: user1) }
  #   let(:agency_invalid) { FactoryGirl.build(:agency, director: user1, name:'') }
  #
  #   it 'Agency is valid with valid attributes' do
  #     expect(agency_valid).to be_valid
  #   end
  #
  #   it 'Agency is invalid with blank attributes' do
  #     expect(agency_invalid).not_to be_valid
  #   end
  #
  #   it 'Agency is invalid with invalid phone' do
  #     agency_valid.phone = 'O665432247'
  #     expect(agency_valid).not_to be_valid
  # end

  describe 'validation' do
    let!(:agency_director) { FactoryGirl.create(:user_agency_director) }
    let(:other_user) { FactoryGirl.create(:user_moderator) }
    let(:agency) { FactoryGirl.build(:agency, director: agency_director) }
    let(:agency_invalid) { FactoryGirl.build(:agency, name: nil, postal_address: nil, phisical_address: nil, phone: nil) }


    it 'is valid with valid attributes' do
      expect(agency).to be_valid
    end

    it 'is invalid with blank attributes' do
      expect(agency_invalid).not_to be_valid
    end

    it 'is invalid with wrong phone format' do
      agency_invalid.phone = '789456213'
      expect(agency_invalid).not_to be_valid
    end

    it 'is invalid with wrong user role' do
      agency.director = other_user
      expect(agency).not_to be_valid

    end

    context 'Agency validation column' do
      it { expect validate_presence_of(:name) }
      it { expect validate_presence_of(:director) }
      it { expect validate_presence_of(:postal_address) }
      it { expect validate_presence_of(:phisical_address) }
      it { expect validate_presence_of(:approved) }
      it { expect validate_presence_of(:phisical_address) }
    end
  end
end
