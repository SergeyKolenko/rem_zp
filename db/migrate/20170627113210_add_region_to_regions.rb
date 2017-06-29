class AddRegionToRegions < ActiveRecord::Migration[5.1]
  def change
    change_table(:regions) do |t|
      t.string   :region
    end
  end
end
