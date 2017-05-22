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

    def admin_update
      @admin = Admin.find(current_admin.id)
    if params[:admin][:password] != ""
      @admin.update_attributes(admin_params)
    else  
      @admin.update_attributes(name: params[:admin][:name], email: params[:admin][:email])
    end
     redirect_to "/"
    end

  protected
  def admin_params
     params.require(:admin).permit(:name,:email, :password, :password_confirmation,:business_id)
  end
end
