class RemoveAddressFromPatients < ActiveRecord::Migration[5.2]
  def change
    remove_column :patients, :address, :string
  end
end
