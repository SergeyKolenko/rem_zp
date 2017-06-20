require 'rails_helper'

RSpec.describe Agency, type: :model do
  # context 'model associations' do
  #   it { expect belong_to(:director) }
  #   it { expect have_many(:users) }
  #   it { expecthave_and_belong_to_many(:cities) }
  #   it { expect have_and_belong_to_many(:regions) }
  #   it { expect have_and_belong_to_many(:districts) }
  # end
  #
  # context 'Agency db column' do
  #   it { expect have_db_column(:approved).of_type(:boolean) }
  #   it { expect have_db_column(:description).of_type(:text) }
  #   it { expect have_db_column(:director_id).of_type(:integer) }
  #   it { expect have_db_column(:name).of_type(:string) }
  #   it { expect have_db_column(:phone).of_type(:string) }
  #   it { expect have_db_column(:postal_address).of_type(:string) }
  #   it { expect have_db_column(:phisical_address).of_type(:string) }
  # end

  describe 'Agency validation' do
    let(:user1) { FactoryGirl.build(:user, role: '') }
    let(:user2) { FactoryGirl.build(:city) }
    let(:proposal1) { FactoryGirl.build(:region) }
    let(:agency1) { FactoryGirl.build(:district) }
    @agency = FactoryGirl.create(:agency)

    it 'Agency is invalid with blank attributes' do
      expect(Agency.create( name: '', director: '', user: '', city: '' )).not_to be_valid
    end

    it 'Agency is valid with valid attributes' do
      @agency.director_id = 1
      @agency.user_id = 1
      expect(@agency).to be_valid
    end

    # context 'Agency validation column' do
    #   it { expect(developer).to validate_presence_of(:name) }
    #   it { expect(developer).to validate_presence_of(:director) }
    #   it { expect(developer).to validate_presence_of(:postal_address) }
    #   it { expect(developer).to validate_presence_of(:phisical_address) }
    #   it { expect(developer).to validate_presence_of(:approved) }
    #   it { expect(developer).to validate_presence_of(:regions) }
    #   it { expect(developer).to validate_presence_of(:user) }
    #   it { expect(developer).to validate_presence_of(:phisical_address) }

  end
end
