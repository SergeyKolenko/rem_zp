require 'rails_helper'

RSpec.describe Proposal, type: :model do
  # context 'Proposal model connection' do
  #   it { expect belong_to(:author) }
  #   it { expect belong_to(:category) }
  #   it { expect belong_to(:region) }
  #   it { expect belong_to(:city) }
  #   it { expect belong_to(:district) }
  #   it { expect have_many(:option_values) }
  #   it { expect have_and_belong_to_many(:types) }
  # end
  #
  # context 'Proposal db column' do
  #   it { expect have_db_column(:title).of_type(:string) }
  #   it { expect have_db_column(:description).of_type(:text) }
  #   it { expect have_db_column(:price).of_type(:float) }
  #   it { expect have_db_column(:promo_price).of_type(:float) }
  #   it { expect have_db_column(:currency).of_type(:string) }
  #   it { expect have_db_column(:street).of_type(:string) }
  #   it { expect have_db_column(:house_number).of_type(:string) }
  #   it { expect have_db_column(:approved).of_type(:boolean) }
  #   it { expect have_db_column(:author_id).of_type(:integer) }
  #   it { expect have_db_column(:category_id).of_type(:integer) }
  #   it { expect have_db_column(:city_id).of_type(:integer) }
  #   it { expect have_db_column(:region_id).of_type(:integer) }
  #   it { expect have_db_column(:district_id).of_type(:integer) }
  #   it { expect have_db_column(:images).of_type(:string) }
  # end
  #
  # context 'Proposal validate column' do
  #   it { expect validate_length_of(:title).is_at_most(50) }
  #   it { expect validate_length_of(:description).is_at_least(100).is_at_most(5000) }
  #   it { expect validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
  #   it { expect validate_numericality_of(:promo_price).is_greater_than_or_equal_to(0) }
  #   it { expect validate_numericality_of(:promo_price).allow_nil }
  #   it { expect validate_length_of(:street).is_at_least(3).is_at_most(30) }
  #   it { expect validate_length_of(:street).allow_nil }
  #   it { expect validate_uniqueness_of(:title) }
  # end

  describe 'Proposal validation' do
    let(:user1) { FactoryGirl.create(:user, role: :agent) }
    let(:region1) { FactoryGirl.build(:region) }
    let(:city_1) { FactoryGirl.build(:city, region: region1) }
    let(:proposal_valid) { FactoryGirl.build(:proposal, region: region1, city: city_1, user: user1) }
    let(:proposal_invalid) { FactoryGirl.build(:proposal, title: '') }

    it 'is valid Proposal with valid attributes' do
      p proposal_valid
      expect(proposal_valid).to be_valid
    end

    it 'is invalid Proposal with blank attributes' do
      expect(proposal_invalid).not_to be_valid
    end
  end
end
