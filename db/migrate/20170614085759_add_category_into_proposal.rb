class AddCategoryIntoProposal < ActiveRecord::Migration[5.1]
  def change
    add_reference :proposals, :category, index: true
  end
end
