class EventsController < ApplicationController
  before_action :verify_user, only: [:edit, :update, :destroy]
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
  def edit
  end
  def update
    if @event.update(event_params)
      redirect_to users_created_events_path
    else
      render :edit 
    end
  end
  def destroy
    @event.destroy
    redirect_to users_created_events_path
  end

  def verify_user
    @event = current_user.created_events.find(params[:id])
    redirect_to events_path, notice: "Not Authorized To Edit This Event" if @event.nil?
  end

  private
  def event_params
    params.require(:event).permit(:event_date, :title)
  end
end
