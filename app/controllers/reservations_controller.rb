class ReservationsController < ApplicationController

  def index
    # 3ヶ月先まで予約することができます。
    @reservations = Reservation.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
    @day = params[:day]
    @time = params[:time]
    @start_time = DateTime.parse(@day + " " + @time + " " + "JST")
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.patient_id = current_patient.id

    # 休診日の曜日を決めるのはこちらから(月曜日: 1,火曜日: 2,水曜日: 3,木曜日 :4,金曜日 :5,土曜日 :6,日曜日 :0)
    # その後、reservations_helper.rbで、時間帯を指定する
    if DateTime.parse(reservation_params[:start_time]).wday == 5 || DateTime.parse(reservation_params[:start_time]).wday == 6 || DateTime.parse(reservation_params[:start_time]).wday == 0
      # エラーメッセージ入れる場合はここを編集する
      # redirect_to reservations_path and return
    end
    if Time.now >= reservation_params[:start_time]
      flash[:notice] = "予約可能時間を過ぎています！！"
      render :show
      return
    end

    if @reservation.save

      WelcomeMailer.confirm(@reservation).deliver_now # send mail to patient
      redirect_to reservation_path @reservation.id
    else
      render :new
    end
  end

  def edit
  end

  def update
    @reservation = Reservation.find(params[:id])
  end

  def destroy
    # @reservation = Reservation.new(reservation_params)
    @reservation = Reservation.find(params[:id])
    if @reservation.destroy
      flash[:success] = "予約を削除しました。"
      redirect_to :mypage
    else
      render :show
    end
  end

  private
  def reservation_params
     params.require(:reservation).permit(:patient_id,:title,:start_time,:day,:time)
  end
end

