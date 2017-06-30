class AddCodeForModels < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :code, :string, index: true
    add_column :types, :code, :string, index: true
    add_column :options, :code, :string, index: true
    add_column :regions, :code, :string, index: true
    add_column :cities, :code, :string, index: true
    add_column :districts, :code, :string, index: true
  end
end
