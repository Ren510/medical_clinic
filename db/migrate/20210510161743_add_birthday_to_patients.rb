class AddBirthdayToPatients < ActiveRecord::Migration[5.2]
  def up
    add_column :patients, :birthday, :date
    change_column :patients, :birthday, :date, :null => false
  end
  def down
    remove_column :patients, :birthday
  end
end
