require 'rails_helper'

RSpec.describe User, type: :model do
  context 'model connection' do
    it { should belong_to(:region) }
    it { should belong_to(:agency) }
  end

  context 'User db column' do
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:region_id).of_type(:integer) }
    it { should have_db_column(:first_name).of_type(:string) }
    it { should have_db_column(:last_name).of_type(:string) }
    it { should have_db_column(:role_id).of_type(:integer) }
    it { should have_db_column(:agency_id).of_type(:integer) }
  end
end



