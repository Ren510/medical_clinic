class ReservationsController < ApplicationController

  def index
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
    if @reservation.save
      WelcomeMailer.welcome(@reservation).deliver_now # send mail to patient
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
  def memos_params
     params.require(:reservations).permit(:patient_id,:title,:start_time,:day,:time)
  end
end

