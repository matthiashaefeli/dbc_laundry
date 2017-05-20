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

  def add_bag
    @client = Client.find(params[:client_id])
    @client.bag_id = params[:bag_id].to_i
    binding.pry
    @client.save
    redirect_to business_path
  end





  protected
  def admin_params
     params.require(:admins).permit(:name,:email, :password, :business_id)
  end
end
