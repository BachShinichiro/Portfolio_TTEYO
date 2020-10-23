class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def index
    @q = Event.ransack(params[:q])
  @events = @q.result(distinct: true)
  end

  def show
    @comments = @event.comments
    @comment = @event.comments.build
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)
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
    params.require(:event).permit(:event_name, :period, :ticket_type, :number_of_ticket, :total_price, :cast_name, :status, :remarks,:flyer, :flyer_cache)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
