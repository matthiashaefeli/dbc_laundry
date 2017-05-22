class ShippersController < ApplicationController
  before_action :authenticate_admin!

  def shipper_new 
    render "./shippers/registrations/new.html.erb"
  end

  def shipper_create
   @shipper = Shipper.create(shipper_params) 
   redirect_to root_path
  end

  def shipper_update
   @shipper = Shipper.find(current_shipper.id)
  if params[:shipper][:password] != ""
    @shipper.update_attributes(shipper_params)
  else  
    @shipper.update_attributes(name: params[:shipper][:name], phone: params[:shipper][:phone], email: params[:shipper][:email])
  end
   redirect_to "/"
  end
  
  protected
  def shipper_params
     params.require(:shipper).permit(:name, :phone,:email, :password, :password_confirmation,:business_id)
  end
end