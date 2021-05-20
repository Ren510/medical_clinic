class AddImageIdToAdminUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :admin_users, :image_id, :string
  end
end
