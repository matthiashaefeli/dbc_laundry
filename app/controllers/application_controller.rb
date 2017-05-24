class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def home
    if current_admin
      @orders = Order.all
      render "./businesses/_form"
    else
      render "./home.html.erb"
    end
  end


  protected
  # devise accept name 
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
