class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path,notice: "イベントを作成しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to events_path
    else
      render :new
    end
  end
  def destroy
    @event.destroy
    redirect_to events_path, notice: 'イベントを削除しました'
  end


  private
  def event_params
    params.require(:event).permit(:event_name, :period, :ticket_type, :number_of_ticket, :total_price, :cast_name, :remarks)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
