class PatientsController < ApplicationController
  before_action :authenticate_patient!
  before_action :correct_patient, only: [:edit, :update]

  def create
    if @patient.save
      NotificationMailer.send_confirm_to_patient(@patient).deliver
      redirect_to @patient
    else
      render 'new'
    end
  end

  def show
    @patient = Patient.find(current_patient.id)
    # @patients = Patient.search(params[:search])
    @patient_reservations = current_patient.reservations.where("start_time >= ?", DateTime.current).order(day: :desc)
    @visit_historys = current_patient.reservations.where("start_time < ?", DateTime.current).where("start_time > ?", DateTime.current << 12).order(day: :desc)
  end

  def edit
    @patient = current_patient
  end

  def update
    @patient = Patient.find(current_patient.id)
    if @patient.update(patient_params)
      redirect_to mypage_path, notice: '会員情報の更新が完了しました。'
    else
      render :edit
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :gender, :birthday, :email, :postal_code, :prefecture_name, :address_city, :address_street, :address_building, :disease, :telephone_number)
  end

  def correct_patient
    @patient = Patient.find(params[:id])
    if current_patient != @patient
      redirect_to patient_path(current_patient)
    end
  end
end
