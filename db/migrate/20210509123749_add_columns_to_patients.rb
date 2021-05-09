class AddColumnsToPatients < ActiveRecord::Migration[5.2]
  def change
    add_column :patients, :postcode, :integer
    add_column :patients, :prefecture_code, :integer
    add_column :patients, :address_city, :string
    add_column :patients, :address_street, :string
    add_column :patients, :address_building, :string
  end
end
