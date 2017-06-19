require 'rails_helper'

RSpec.describe Region, type: :model do
  context 'Region model connection' do
    it { expect have_many(:cities) }
    it { expect have_many(:proposals) }
    it { expect have_and_belong_to_many(:agencies) }
  end

  context 'Region db column' do
    it { expect have_db_column(:name).of_type(:string)}
  end
end
