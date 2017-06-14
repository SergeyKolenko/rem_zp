class AddJoinTableTypeProposal < ActiveRecord::Migration[5.1]
  def change
    create_join_table :types, :proposals do |t|
      t.index [:type_id, :proposal_id]
      t.index [:proposal_id, :type_id]
    end
  end
end
