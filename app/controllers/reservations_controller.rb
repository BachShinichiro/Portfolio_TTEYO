class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  def new
    @reservation = Reservation.new
  end
  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      ReservationMailer.reservation_mail(@reservation).deliver  ##追記
      redirect_to reservations_path, notice: 'Reservation was successfully created.'
    else
      render :new
    end
  end
  private
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
  def reservation_params
    params.require(:reservation).permit(:name, :email, :content)
  end
end
