class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:edit, :show, :update, :destroy]
  before_action :set_event, only: [:new, :create, :show, :index]
  
  
  def index
    @reservations = current_user.reservations
  end

  def new
    @reservation = current_user.reservations.build
  end

  def show;end

  def edit;end

  def create
    @reservation = current_user.reservations.build(reservation_params)
    @reservation.event = @event
    if @reservation.save
      ReservationMailer.reservation_mail(@reservation).deliver  ##追記
      redirect_to event_reservation_path(@event, @reservation), notice: 'Reservation was successfully created.'
    else
      render :new
    end
  end

  def update
    if @reservation.update(reservation_params)
      redirect_to reservations_path
    else
      render :new
    end
  end

  def destroy
    @reservation.destroy
    redirect_to reservations_path(current_user), notice: 'イベントを削除しました'
  end

  private
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
  def set_event
    @event = Event.find(params[:event_id])
  end
  def reservation_params
    params.require(:reservation).permit(:date, :ticket_type, :number_of_ticket, :total_price, :remarks, :cast_name)
  end
end
