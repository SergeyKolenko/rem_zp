require 'rails_helper'

RSpec.describe OptionValue, type: :model do
  # context 'model associations' do
  #   it { expect belong_to(:proposal) }
  #   it { expect belong_to(:option) }
  # end
  #
  # context 'db column' do
  #   it { expect have_db_column(:value).of_type(:string) }
  #   it { expect have_db_column(:proposal_id).of_type(:integer) }
  #   it { expect have_db_column(:option_id).of_type(:integer) }
  # end

  describe 'validation' do
    let!(:category) { FactoryGirl.create(:category, name: 'Дом', weight: 1) }
    # let!(:option) { FactoryGirl.create(:square) }
    let!(:user) { FactoryGirl.create(:user_moderator) }
    let(:region) { FactoryGirl.create(:region) }
    let(:city) { FactoryGirl.create(:city, region: region) }
    let!(:district) {FactoryGirl.create(:district, city: city)}
    let(:proposal) { FactoryGirl.create(:proposal, author: user, region: region, city: city, category: option.categories, district: district) }
    let(:option_value_valid) { FactoryGirl.build(:option_value, proposal: proposal, option: option) }
    let(:option_value_invalid) { FactoryGirl.build(:option_value, value: '') }
    before(:all) do
      category = Category.create(name: 'Дом', weight: 1)
      option = Option.create(name: 'Square', unit: 'm<sup>2</sup>')
      option.categories << category
    end


    it 'is valid with valid attributes' do
      option_value_valid.proposal.option.categories << option.category
      p option_value_valid
      expect(option_value_valid).to be_valid
    end

    it 'is invalid with blank attributes' do
      expect(option_value_invalid).not_to be_valid
    end

  end
end
