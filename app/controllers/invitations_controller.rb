class InvitationsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create]
  def create
    event = current_user.created_events.find(params[:event_id])
    if not event.nil? and event.invitations.build(guest_id: User.find_by(email: params[:email]).id).save
      redirect_to events_path + "/" + params[:event_id]
    end
  end
  #def invitation_params
  #  params.require(:event).permit(:event_date, :title)
  #end
end
