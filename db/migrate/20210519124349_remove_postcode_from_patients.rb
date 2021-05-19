class RemovePostcodeFromPatients < ActiveRecord::Migration[5.2]
  def change
    remove_column :patients, :postcode, :integer
  end
end
