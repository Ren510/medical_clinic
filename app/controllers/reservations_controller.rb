class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
  end

  def show
    @patient = Patient.find(current_patient.id)
  end

  def new
    @reservation = Reservation.new
    @day = params[:day]
    @time = params[:time]
    @start_time = DateTime.parse(@day + " " + @time + " " + "JST")
  end

  def create
    @reservation = Reservation.new(reservation_params)
    # if reservation_params[:start_time].wday == 1
    # end

    # def date_before_start
    #   errors.add(:start_time, "は過去の日付を選択できません") if start_time < Date.today
    # end

    # 休診日の曜日を決めるのはこちらから(月曜日: 1,火曜日: 2,水曜日: 3,木曜日 :4,金曜日 :5,土曜日 :6,日曜日 :0)
    if DateTime.parse(reservation_params[:start_time]).wday == 5 || DateTime.parse(reservation_params[:start_time]).wday == 6
      # エラーメッセージ入れる場合はここを編集する
      # redirect_to reservations_path and return
    end
    if @reservation.save
      # WelcomeMailer.welcome(@reservation).deliver_now # send mail to patient
      redirect_to reservation_path @reservation.id
    else
      render :new
    end
  end

  def edit
  end

  def update
  end



  private
  def reservation_params
     params.require(:reservation).permit(:patient_id,:title,:start_time,:day,:time)
  end
end

