ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation, :image, :name, :introduction

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.attachment_field :image
      f.input :name
      f.input :introduction
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
  # 詳細ページ
  show do
    attributes_table do
      row :id
      row :image do |au|
        attachment_image_tag au, :image
      end
      row :name
      row :email
      row :introduction
    end
  end
end
