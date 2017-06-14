class CreateOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :options do |t|
      t.string :name
      t.string :unit

      t.timestamps
    end

    add_index :options, :name
  end
end
