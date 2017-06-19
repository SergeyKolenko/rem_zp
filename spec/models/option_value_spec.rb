require 'rails_helper'

RSpec.describe OptionValue, type: :model do
  # let(:option_value_valid) { FactoryGirl.build(:option_value, proposal: build(:proposal), option: build(:option)) }
  # let(:option_value_invalid) { FactoryGirl.build(:option_value, value: '') }
  #
  # it 'is valid OptionValue with valid attributes' do
  #   p option_value_valid
  #   expect(option_value_valid).to be_valid
  # end
  #
  # it 'is invalid OptionValue with blank attributes' do
  #   p option_value_invalid
  #   expect(option_value_invalid).not_to be_valid
  # end

  context 'OptionValue model connection' do
    it { expect belong_to(:proposal) }
    it { expect belong_to(:option) }
  end

  context 'OptionValue db column' do
    it { expect have_db_column(:value).of_type(:string) }
    it { expect have_db_column(:proposal_id).of_type(:integer) }
    it { expect have_db_column(:option_id).of_type(:integer) }
  end
end
