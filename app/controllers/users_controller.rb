class UsersController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create]
  def my_events
    @user = current_user 
  end
end
