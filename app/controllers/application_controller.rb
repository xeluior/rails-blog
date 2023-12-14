class ApplicationController < ActionController::Base
  include Pundit::Authorization
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: %i[fullname])
  end
  
  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized for that resource.'
    redirect_to :root
  end
end
