class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def home
    if current_admin
      # binding.pry
      if request.xhr?
        status = params[:order][:order_status]
        case status

          when 'In Box'
           @orders = Order.where(status: 'In Box')
          when 'Incomming'
            @orders = Order.where(status: 'Incomming')
          when 'Processing'
            @orders = Order.where(status: 'Processing')
          when 'Shipping'
            @orders = Order.where(status: 'Shipping')
          when 'Delivered'
            @orders = Order.where(status: 'Delivered')
          else
            @orders = Order.all
        end
          respond_to do |format|
          format.html '_orders.html.erb'
          format.js 
          end
      else 
        @orders = Order.all 
      end 
        render "./static_pages/admins_dash.html.erb"
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
