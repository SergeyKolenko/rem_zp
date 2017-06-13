require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'model connection' do
    it { should have_many(:proposals) }
  end

  context 'Category db column' do
    it { should have_db_column(:name).of_type(:string)}
    it { should have_db_column(:weight).of_type(:integer)}
  end
end
