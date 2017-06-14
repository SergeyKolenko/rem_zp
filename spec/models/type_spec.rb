require 'rails_helper'

RSpec.describe Type, type: :model do
  context 'Type model connection' do
    it { should have_and_belong_to_many(:proposals) }
  end

  context 'Type db column' do
    it { should have_db_column(:name).of_type(:string) }
  end
end
