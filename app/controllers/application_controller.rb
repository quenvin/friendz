class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # if user_signed_in?
  #   super
  # else 
  #   redirect_to new_user_session, :notice => "You entered the wrong password ! "
  # end






end
