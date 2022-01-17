class AttendeeEventController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create]
  def create
    @attev = current_user.attendee_events.build({event_id: params[:event_id]})#attev_params)
    if @attev.save
      redirect_back(fallback_location: root_path)
    else
      puts @attev.errors.full_messages
      #render :new
      redirect_back(fallback_location: root_path)
    end
  end
  #private
  #def attev_params
  #  params.require(:event).permit(:event_id)
  #end
end
