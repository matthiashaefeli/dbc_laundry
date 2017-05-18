class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:client).permit(:name, :phone,:business_id, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:client).permit(:name, :phone,:business_id, :email, :password, :password_confirmation)
  end
end