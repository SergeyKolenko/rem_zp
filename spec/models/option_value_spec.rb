require 'rails_helper'

RSpec.describe OptionValue, type: :model do
  context 'OptionValue model connection' do
    it { expect belong_to(:proposal) }
    it { expect belong_to(:option) }
  end

  context 'OptionValue db column' do
    it { expect have_db_column(:value).of_type(:string) }
    it { expect have_db_column(:proposal_id).of_type(:integer) }
    it { expect have_db_column(:option_id).of_type(:integer) }
  end

  describe 'OptionValue validation' do
    # let(:category1) { FactoryGirl.build(:category, name: 'Дом', weight: 1) }
    # let(:proposal1) { FactoryGirl.create(:proposal, category: category1) }
    # let(:option1) { FactoryGirl.create(:square) }
    # let(:option_value_valid) { FactoryGirl.create(:option_value, proposal: proposal1, option: option1) }
    # let(:option_value_invalid) { FactoryGirl.build(:option_value, value: '') }


    let(:category1) { FactoryGirl.build(:category, name: 'Дом', weight: 1) }
    let(:role1) { FactoryGirl.build(:agent) }
    let(:user1) { FactoryGirl.build(:user, role: role1) }
    let(:region1) { FactoryGirl.build(:region, name: Faker::StarWars.planet) }
    let(:city1) { FactoryGirl.build(:city, region: region1) }
    let(:proposal1) { FactoryGirl.build(:proposal, author: user1, region: region1, city: city1, category: category1) }
    let(:option_value_valid) { FactoryGirl.create(:option_value, proposal: proposal1, option: option1) }
    let(:option_value_invalid) { FactoryGirl.build(:option_value, value: '') }

    it 'is valid OptionValue with valid attributes' do
      p option_value_valid
      expect(option_value_valid).to be_valid
    end

    it 'is invalid OptionValue with blank attributes' do
      p option_value_invalid
      expect(option_value_invalid).not_to be_valid
    end

  end
end
