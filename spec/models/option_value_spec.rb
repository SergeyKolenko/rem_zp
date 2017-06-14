require 'rails_helper'

RSpec.describe OptionValue, type: :model do
  context 'OptionValue model connection' do
    it { should belong_to(:proposal) }
    it { should belong_to(:option) }
  end

  context 'OptionValue db column' do
    it { should have_db_column(:value).of_type(:string) }
    it { should have_db_column(:proposal_id).of_type(:integer) }
    it { should have_db_column(:option_id).of_type(:integer) }
  end
end
