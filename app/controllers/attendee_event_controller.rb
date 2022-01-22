class AttendeeEventController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create]
  def create
    @attev = current_user.attendee_events.build({event_id: params[:id]})
    if @attev.save
      redirect_back(fallback_location: root_path)
    else
      puts @attev.errors.full_messages
      redirect_back(fallback_location: root_path)
    end
  end
  def destroy
    @attev = current_user.attendee_events.find_by({event_id: params[:id]}).destroy
    redirect_back(fallback_location: root_path)
  end
end
