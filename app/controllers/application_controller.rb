class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!


  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  # if user_signed_in?
  #   super
  # else 
  #   redirect_to new_user_session, :notice => "You entered the wrong password ! "
  # end






end
