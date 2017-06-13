require 'rails_helper'

RSpec.describe Region, type: :model do
  context 'model connection' do
    it { should have_many(:cities) }
  end

  context 'Region db column' do
    it { should have_db_column(:name).of_type(:string)}
  end
end
