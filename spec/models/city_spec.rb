require 'rails_helper'

RSpec.describe City, type: :model do
  context 'model connection' do
    it { should belong_to(:region) }
    it { should have_many(:districts) }
    it { should have_and_belong_to_many(:agencies) }
  end

  context 'City db column' do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:region_id).of_type(:integer) }
  end
end
