require 'rails_helper'

RSpec.describe Agency, type: :model do
  context 'model associations' do
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

  describe 'Agency validation' do
    let(:role1) { FactoryGirl.build(:agency_director) }
    let(:user1) { FactoryGirl.build(:user, role: role1) }
    let(:agency_valid) { FactoryGirl.build(:agency, director: user1) }
    let(:agency_invalid) { FactoryGirl.build(:agency, director: user1, name:'') }

    it 'Agency is valid with valid attributes' do
      expect(agency_valid).to be_valid
    end

    it 'Agency is invalid with blank attributes' do
      expect(agency_invalid).not_to be_valid
    end

    it 'Agency is invalid with invalid phone' do
      agency_valid.phone = 'O665432247'
      expect(agency_valid).not_to be_valid
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
