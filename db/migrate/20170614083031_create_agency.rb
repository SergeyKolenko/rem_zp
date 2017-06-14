class CreateAgency < ActiveRecord::Migration[5.1]
  def change
    create_table :agencies do |t|
      t.string :name
      t.string :logo
      t.string :postal_address
      t.string :phisical_address
      t.text   :description
      t.boolean :approved, default: false
      t.references :director, references: :users
      t.timestamp
    end
  end
end
