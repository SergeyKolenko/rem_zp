require 'rails_helper'

RSpec.describe OptionValue, type: :model do
  # let(:option1) { FactoryGirl.build(:option) }
  # let(:proposal1) { FactoryGirl.build(:proposal) }
  # let(:option_value1) { FactoryGirl.create(:option_value, option: option1, proposal: proposal1 ) }
  let(:option_value1) { FactoryGirl.build(:option_value) }
  let(:option_value2) { FactoryGirl.build(:option_value, value: '') }

  it 'is valid OptionValue with valid attributes' do
    p option_value1
    expect(option_value1).to be_valid
  end

  it 'is invalid OptionValue with blank attributes' do
    p option_value2
    expect(option_value2).not_to be_valid
  end

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
end
