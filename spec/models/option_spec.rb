require 'rails_helper'

RSpec.describe Option, type: :model do
  context 'model connection' do
    it { should have_many(:option_values) }
    it { should have_and_belong_to_many(:categories) }
  end

  context 'Region db column' do
    it { should have_db_column(:name).of_type(:string)}
  end

  context 'Option validate column' do
    it { should validate_length_of(:name).is_at_least(2).is_at_most(20) }
  end
end