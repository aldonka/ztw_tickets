class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update]

  def index
    if is_admin?
      @events = Event.all.order('artist', 'event_date')
    else
      @events = Event.where('event_date >= ?', Date.today).order('artist', 'event_date')
    end

  end

  def event_tickets
    if is_admin?
      set_event
      @tickets = Ticket.where('event_id = ?', params[:id])
    else
      respond_to do |format|
        format.html { redirect_to static_pages_home_path, notice: 'Nie posiadasz odpowiednich praw.' }
        format.json { head :no_content }
      end
    end

  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:info] = 'Event został poprawnie stworzony.'
      redirect_to events_path
    else
      render :action => "new"
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to events_path, notice: 'Wydarzenie zostało zaktualizowane.' }
        format.json { render :show, status: :ok, location: events_path }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_event
    begin
      @event = Event.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @event = nil
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:artist, :event_date, :price_low, :price_high, :description, :for_adults, :tickets_no)
  end

end
