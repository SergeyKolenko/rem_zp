class AddIndex < ActiveRecord::Migration[5.1]
  def change
    add_index :agencies, :name
    add_index :categories, :name
    add_index :cities, :name
    add_index :districts, :name
    add_index :option_values, :value
    add_index :regions, :name
    add_index :roles, :name
  end
end
