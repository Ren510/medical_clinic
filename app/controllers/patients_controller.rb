class PatientsController < ApplicationController
  def create
    if @patient.save
      NotificationMailer.send_confirm_to_user(@patient).deliver
      redirect_to @patient
    else
      render 'new'
    end
  end
  
  def show
  end

  def edit
  end

  def update
  end
end
