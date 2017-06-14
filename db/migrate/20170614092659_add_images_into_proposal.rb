class AddImagesIntoProposal < ActiveRecord::Migration[5.1]
  def change
    add_column :proposals, :images, :string, array: true, default: []
  end
end
