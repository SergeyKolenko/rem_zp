require 'rails_helper'

RSpec.describe OptionValue, type: :model do
  context 'OptionValue model connection' do
    it { should belong_to(:proposal) }
    it { should belong_to(:option) }
  end
end
