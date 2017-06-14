class OptionValue < ApplicationRecord
  belongs_to :proposal
  belongs_to :option

  delegate :name, :unit, :categories, to: :option, prefix: true

  validates :value, :proposal, :option, presence: true
  validates :proposal, inclusion: { in: Proc.new { |ov| ov.option_categories.include? ov.proposal.category } }

end
