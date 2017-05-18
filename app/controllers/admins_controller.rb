class AdminsController < ApplicationController
  before_action :authenticate_admin!

  def admin_new 
    render "./admins/registrations/new.html.erb"
  end

  def admin_create
# missing handling error messages and if not saved
   @admin = Admin.create(admin_params) 
   redirect_to root_path
  end





  protected
  def admin_params
     params.require(:admins).permit(:name,:email, :password, :business_id)
  end
end