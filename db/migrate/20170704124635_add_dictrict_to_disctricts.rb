class AddDictrictToDisctricts < ActiveRecord::Migration[5.1]
  def change
    change_table(:districts) do |t|
      t.string   :district
    end
  end
end
