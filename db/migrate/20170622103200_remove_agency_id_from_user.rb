class RemoveAgencyIdFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_index :users, :agency_id
    remove_column :users, :agency_id
  end
end
