class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
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

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:artist, :event_date, :price_low, :price_high, :description, :for_adults, :tickets_no)
  end
end
