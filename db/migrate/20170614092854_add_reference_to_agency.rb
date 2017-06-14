class AddReferenceToAgency < ActiveRecord::Migration[5.1]
  create_join_table :agencies, :regions do |t|
    t.index [:agency_id, :region_id]
    t.index [:region_id, :agency_id]
  end

  create_join_table :agencies, :cities do |t|
    t.index [:agency_id, :city_id]
    t.index [:city_id, :agency_id]
  end

  create_join_table :agencies, :districts do |t|
    t.index [:agency_id, :district_id]
    t.index [:district_id, :agency_id]
  end
end
