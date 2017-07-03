class AddCityToCities < ActiveRecord::Migration[5.1]
  def change
    change_table(:cities) do |t|
      t.string   :city
    end
  end
end
