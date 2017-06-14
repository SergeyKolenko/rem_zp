require 'rails_helper'

RSpec.describe Proposal, type: :model do
  context 'Proposal model connection' do
    it { should belong_to(:author) }
    it { should belong_to(:category) }
    it { should belong_to(:region) }
    it { should belong_to(:city) }
    it { should belong_to(:district) }
    it { should have_many(:option_values) }
    it { should have_and_belong_to_many(:types) }
  end

  context 'Proposal db column' do
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:description).of_type(:text) }
    it { should have_db_column(:price).of_type(:float) }
    it { should have_db_column(:promo_price).of_type(:float) }
    it { should have_db_column(:currency).of_type(:string) }
    it { should have_db_column(:street).of_type(:string) }
    it { should have_db_column(:house_number).of_type(:string) }
    it { should have_db_column(:approved).of_type(:boolean) }
    it { should have_db_column(:author_id).of_type(:integer) }
    it { should have_db_column(:category_id).of_type(:integer) }
    it { should have_db_column(:city_id).of_type(:integer) }
    it { should have_db_column(:region_id).of_type(:integer) }
    it { should have_db_column(:district_id).of_type(:integer) }
    it { should have_db_column(:images).of_type(:string) }
  end

  context 'Proposal validate column' do
    it { should validate_length_of(:title).is_at_most(50) }
    it { should validate_length_of(:description).is_at_least(100).is_at_most(5000) }
    it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:promo_price).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:promo_price).allow_nil }
    it { should validate_length_of(:street).is_at_least(3).is_at_most(30) }
    it { should validate_length_of(:street).allow_nil }
  end
end
