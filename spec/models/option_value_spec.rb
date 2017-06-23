require 'rails_helper'

RSpec.describe OptionValue, type: :model do
  context 'model associations' do
    it { expect belong_to(:proposal) }
    it { expect belong_to(:option) }
  end

  context 'db column' do
    it { expect have_db_column(:value).of_type(:string) }
    it { expect have_db_column(:proposal_id).of_type(:integer) }
    it { expect have_db_column(:option_id).of_type(:integer) }
  end

  describe 'validation' do

    before(:all) do
      @category = FactoryGirl.create(:category, name: 'Дом', weight: 1)
      @option = FactoryGirl.create(:square)
      @option.categories << @category
    end

    let!(:user) { FactoryGirl.create(:user_moderator) }
    let(:region) { FactoryGirl.create(:region) }
    let(:city) { FactoryGirl.create(:city, region: region) }
    let!(:district) {FactoryGirl.create(:district, city: city)}
    let!(:proposal) { FactoryGirl.create(:proposal, author: user, region: region, city: city, category: @category, district: district) }
    let!(:option_value) { FactoryGirl.build(:option_value, proposal: proposal, option: @option) }
    let!(:option_value_invalid) { FactoryGirl.build(:option_value, value: '') }

    it 'is valid with valid attributes' do
      expect(option_value).to be_valid
    end

    it 'is invalid with blank attributes' do
      expect(option_value_invalid).not_to be_valid
    end
  end
end
