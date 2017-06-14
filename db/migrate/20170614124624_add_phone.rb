class AddPhone < ActiveRecord::Migration[5.1]
  def change
    add_column :agencies, :phone, :string
    add_column :users, :phone, :string
  end
end
