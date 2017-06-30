class AddTranslatesIntoModels < ActiveRecord::Migration[5.1]
  def change
    reversible do |dir|
      dir.up do
        Category.create_translation_table! name: :string
        City.create_translation_table!     name: :string
        District.create_translation_table! name: :string
        Region.create_translation_table!   name: :string
        Type.create_translation_table!     name: :string
        Option.create_translation_table!   name: :string, unit: :string
      end

      dir.down do
        Category.drop_translation_table!
        City.drop_translation_table!
        District.drop_translation_table!
        Region.drop_translation_table!
        Type.drop_translation_table!
        Option.drop_translation_table!
      end
    end
  end
end
