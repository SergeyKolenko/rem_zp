require 'rails_helper'

RSpec.describe Role, type: :model do
  context 'model connection' do
    it { should have_many(:users) }
  end

  context 'Role db column' do
    it { should have_db_column(:name).of_type(:string) }
  end
end