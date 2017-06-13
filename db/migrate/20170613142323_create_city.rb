class CreateCity < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.string :name
      t.references :region, foreign_key: true
    end
  end
end
