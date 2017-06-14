class AddFieldsIntoProposal < ActiveRecord::Migration[5.1]
  def change
    add_reference :proposals, :city, index: true
    add_reference :proposals, :region, index: true
    add_reference :proposals, :district, index: true
  end
end
