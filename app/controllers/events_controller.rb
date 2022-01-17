class EventsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create]
  def new
    @event = Event.new
  end
  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to new_event_path
    else
      puts @event.errors.full_messages
      render :new
    end
  end
  def index
    @events = Event.all
  end
  def show
    @event = Event.find(params[:id])
  end
  private
  def event_params
    params.require(:event).permit(:event_date, :title)
  end
end
