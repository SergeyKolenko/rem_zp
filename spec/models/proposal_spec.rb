require 'rails_helper'

RSpec.describe Proposal, type: :model do
  context 'model associations' do
    it { expect belong_to(:author) }
    it { expect belong_to(:category) }
    it { expect belong_to(:region) }
    it { expect belong_to(:city) }
    it { expect belong_to(:district) }
    it { expect have_many(:option_values) }
    it { expect have_and_belong_to_many(:types) }
  end

  context 'db column' do
    it { expect have_db_column(:title).of_type(:string) }
    it { expect have_db_column(:description).of_type(:text) }
    it { expect have_db_column(:price).of_type(:float) }
    it { expect have_db_column(:promo_price).of_type(:float) }
    it { expect have_db_column(:currency).of_type(:string) }
    it { expect have_db_column(:street).of_type(:string) }
    it { expect have_db_column(:house_number).of_type(:string) }
    it { expect have_db_column(:approved).of_type(:boolean) }
    it { expect have_db_column(:author_id).of_type(:integer) }
    it { expect have_db_column(:category_id).of_type(:integer) }
    it { expect have_db_column(:city_id).of_type(:integer) }
    it { expect have_db_column(:region_id).of_type(:integer) }
    it { expect have_db_column(:district_id).of_type(:integer) }
    it { expect have_db_column(:images).of_type(:string) }
  end

  context 'validate column' do
    it { expect validate_length_of(:title).is_at_most(50) }
    it { expect validate_length_of(:description).is_at_least(100).is_at_most(5000) }
    it { expect validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
    it { expect validate_numericality_of(:promo_price).is_greater_than_or_equal_to(0) }
    it { expect validate_numericality_of(:promo_price).allow_nil }
    it { expect validate_length_of(:street).is_at_least(3).is_at_most(30) }
    it { expect allow_value(nil).for(:street) }
    it { expect validate_uniqueness_of(:title) }
  end

  describe 'validation' do
    let!(:category) { FactoryGirl.create(:category, name: 'Дом', weight: 1) }
    let!(:user) { FactoryGirl.create(:user_moderator) }
    let!(:region) { FactoryGirl.create(:region) }
    let(:other_region) { FactoryGirl.create(:region, name: 'REGION') }
    let!(:city) { FactoryGirl.create(:city, region: region) }
    let!(:other_city) { FactoryGirl.create(:city, region: other_region) }
    let!(:district) {FactoryGirl.create(:district, city: city)}
    let(:proposal) { FactoryGirl.build(:proposal, author: user, region: region, city: city, category: category, district: district) }

    it 'is valid with valid attributes' do
      expect(proposal).to be_valid
    end

    it 'is invalid with other wrong city' do
      proposal.region = other_region
      expect(proposal).not_to be_valid
    end

    it 'is invalid with other wrong district' do
      proposal.city = other_city
      expect(proposal).not_to be_valid
    end

    it 'is valid with blank district' do
      proposal.district = nil
      expect(proposal).to be_valid
    end

    it 'is invalid with other wrong currency' do
      proposal.currency = 'RUB'
      expect(proposal).not_to be_valid
    end
  end
end
