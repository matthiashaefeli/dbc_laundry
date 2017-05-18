class ShippersController < ApplicationController
  before_action :authenticate_admin!

  def shipper_new 
    render "./shippers/registrations/new.html.erb"
  end

  def shipper_create
   @shipper = Shipper.create(shipper_params) 
   redirect_to root_path
  end





  protected
  def shipper_params
     params.require(:shippers).permit(:phone,:email, :password)
  end
end