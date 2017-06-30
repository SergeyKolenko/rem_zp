class AddAgencyIdIntoUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :agency, index: true  end
end
