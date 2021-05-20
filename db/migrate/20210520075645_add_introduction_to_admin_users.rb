class AddIntroductionToAdminUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :admin_users, :introduction, :text
  end
end
