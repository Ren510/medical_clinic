ActiveAdmin.register Reservation do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :patient_id, :title, :start_time, :day, :time
  #
  # or
  #
  # permit_params do
  #   permitted = [:patient_id, :title, :start_time, :day, :time]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
