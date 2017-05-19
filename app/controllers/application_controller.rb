class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
 

  def home
    render "./home.html.erb"
  end

  protected
  # devise accept name 
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
