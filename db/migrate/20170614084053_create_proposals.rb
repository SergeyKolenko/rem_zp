class CreateProposals < ActiveRecord::Migration[5.1]
  def change
    create_table :proposals do |t|
      t.string :title
      t.text :description
      t.float :price
      t.float :promo_price
      t.string :currency
      t.string :street
      t.string :house_number
      t.boolean :approved
      t.references :author, references: :users

      t.timestamps
    end
    add_index :proposals, :title
    add_index :proposals, :price
  end
end
