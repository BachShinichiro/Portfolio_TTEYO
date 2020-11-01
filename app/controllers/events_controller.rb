class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]
  before_action :check_client, only: [:new, :create, :edit, :update]

  def index
    @q = Event.ransack(params[:q])
    @events = @q.result(distinct: true).order(created_at: "DESC")
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
    params.require(:event).permit(:event_name, :period, :period_end, :company_name, :price, :place, :status, :direction ,:remarks,:flyer, :flyer_cache)
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def check_user
    set_event
    if current_user.id != @event.user_id
      flash[:notice] = '他のユーザーの投稿は修正できません'
      redirect_to events_path 
    end
  end

  def check_client
    if current_user.client == false
      flash[:notice] = '一般ユーザーは投稿できません'
      redirect_to events_path 
    end
  end
end
