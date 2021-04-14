class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:edit, :show, :update, :destroy]
  before_action :set_event
  
  
  def index
    @reservations = @event.reservations 
  end

  def new
    @reservation = current_user.reservations.build
    @select_dates = @event.select_dates
  end

  def show;end

  def edit
    @select_dates = @event.select_dates
  end

  def create
    @reservation = current_user.reservations.build(reservation_params)
    @reservation.event = @event
    if @reservation.save
      ReservationMailer.reservation_mail(@reservation).deliver  ##追記
      redirect_to event_reservation_path(@event, @reservation), notice: '予約完了いたしました！確認メールご確認ください.'
    else
      render :new
    end
  end

  def update
    if @reservation.update(reservation_params)
      redirect_to event_reservations_path(@event, @reservation)
    else
      render :new
    end
  end

  def destroy
    @reservation.destroy
    if current_user.client 
      redirect_to event_reservations_path(@event, @reservation), notice: '予約を削除しました'
    else
      redirect_to user_path(current_user)
    end
  end

  private
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
  def set_event
    @event = Event.find(params[:event_id])
  end
  def reservation_params
    params.require(:reservation).permit(:date, :ticket_type, :number_of_ticket, :total_price, :remarks, :cast_name, select_dates_attributes: [:event_date])
  end
end
