class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
  end

  def show
  end

  def new
  end

  def create
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

