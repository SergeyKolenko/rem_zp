require 'rails_helper'

RSpec.describe Proposal, type: :model do
  context 'model connection' do
    it { should have_and_belong_to_many(:types) }
  end
end
