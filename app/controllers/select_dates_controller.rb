class Select_datesController < ApplicationController
  before_action :set_select_date, only: [:show, :edit, :update, :destroy]
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  def index
    @select_dates = Select_date.all
  end

  def show
  end

  def new
    @select_date = Select_date.new
  end

  def edit
  end

  def create
    @select_date = Select_date.new(select_date_params)

    respond_to do |format|
      if @select_date.save
        format.html { redirect_to @select_date, notice: 'Select_date was successfully created.' }
        format.json { render :show, status: :created, location: @select_date }
      else
        format.html { render :new }
        format.json { render json: @select_date.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @select_date.update(select_date_params)
        format.html { redirect_to @select_date, notice: 'Select_date was successfully updated.' }
        format.json { render :show, status: :ok, location: @select_date }
      else
        format.html { render :edit }
        format.json { render json: @select_date.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @select_date.destroy
    respond_to do |format|
      format.html { redirect_to select_dates_url, notice: 'Select_date was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_select_date
    @select_date = SelectDate.find(params[:id])
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def select_date_params
    params.require(:select_date).permit(:name, :event_date)
  end
end
