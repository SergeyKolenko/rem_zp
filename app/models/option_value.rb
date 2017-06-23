class OptionValue < ApplicationRecord
  belongs_to :proposal
  belongs_to :option

  delegate :name, :unit, :categories, to: :option, prefix: true

  validates :value, :proposal, :option, presence: true
  validates :proposal_id, inclusion: { in: :valid_proposals }

  private
  def valid_proposals
    Proposal.where(category: option.try(:categories)).pluck(:id)
  end

end
