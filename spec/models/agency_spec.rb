require 'rails_helper'

RSpec.describe Agency, type: :model do
  context 'model connection' do
    it { should belong_to(:director) }
    it { should have_many(:users) }
    it { should have_and_belong_to_many(:cities) }
    it { should have_and_belong_to_many(:regions) }
    it { should have_and_belong_to_many(:districts) }
  end

  context 'Agency db column' do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:postal_address).of_type(:string) }
    it { should have_db_column(:phisical_address).of_type(:string) }
    it { should have_db_column(:description).of_type(:text) }
    it { should have_db_column(:director_id).of_type(:integer) }
    it { should have_db_column(:approved).of_type(:boolean) }
  end
end
