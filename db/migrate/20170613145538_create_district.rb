class CreateDistrict < ActiveRecord::Migration[5.1]
  def change
    create_table :districts do |t|
      t.string :name
      t.references :city, foreign_key: true
    end
  end
end
