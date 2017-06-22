require 'rails_helper'

RSpec.describe OptionValue, type: :model do
  # context 'OptionValue model connection' do
  #   it { expect belong_to(:proposal) }
  #   it { expect belong_to(:option) }
  # end
  #
  # context 'OptionValue db column' do
  #   it { expect have_db_column(:value).of_type(:string) }
  #   it { expect have_db_column(:proposal_id).of_type(:integer) }
  #   it { expect have_db_column(:option_id).of_type(:integer) }
  # end

  describe 'validation' do
    let(:category1) { FactoryGirl.build(:category, name: 'Дом', weight: 1) }
    let(:proposal1) { FactoryGirl.create(:proposal, category: category1) }
    let(:option1) { FactoryGirl.create(:square) }

    # let(:option_value_valid) { FactoryGirl.build(:option_value, proposal_id: 1, option: option1) }
    let(:option_value_valid) { FactoryGirl.create(:option_value, proposal: proposal1, option: option1) }

    let(:option_value_invalid) { FactoryGirl.build(:option_value, value: '') }

    it 'is valid with valid attributes' do
      expect(option_value_valid).to be_valid
    end

    it 'is invalid with blank attributes' do
      expect(option_value_invalid).not_to be_valid
    end

  end
end
