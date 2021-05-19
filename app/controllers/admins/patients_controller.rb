class Admin::PatientsController < ApplicationController
  # before_action :authenticate_admin!

   PER = 10
  def index
    # @patients = patient.all.order(:id) ## idの降順
    @patients = Patient.page(params[:page]).per(10)

    # @search_params = patient_search_params
    # @patients = Patient.search(@search_params).includes(:prefecture)
  end

  def show
     @patient = Patient.find(params[:id])
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update(patient_params)
      redirect_to admin_patient_path(@patient.id)
    else
      render :edit
    end

  end

  private
  def patient_params
    params.require(:patient).permit(:first_name,:last_name,:first_name_kana,:last_name_kana,:gender,:birthday,:email,:postal_code,:prefecture_name,:address_city,:address_street,:address_building,:disease,:telephone_number)
  end

  # def patient_search_params
  #   params.fetch(:search, {}).permit(:first_name, :last_name :gender, :birthday_from, :birthday_to, :prefecture_)
  # end
  # private
  # def patient_params
  #     params.require(:patient).permit(:last_name, :first_name, :email, :is_deleted)
  # end

end

