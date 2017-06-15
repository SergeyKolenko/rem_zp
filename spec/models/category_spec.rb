require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'model connection' do
    it { should have_many(:proposals) }
  end

  context 'Category db column' do
    it { should have_db_column(:name).of_type(:string)}
    it { should have_db_column(:weight).of_type(:integer)}
  end

  context 'Category validate column' do
    it { should validate_numericality_of(:weight).is_greater_than(0) }
  end

  discribe 'Category validation with FactoryGirl' do
    let(:user1) { FactoryGirl.create(:user) }
    let(:proposal1) { FactoryGirl.create(:proposal) }
    context 'User db column' do

    end

  end
end
