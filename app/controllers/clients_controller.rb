class ClientsController < ApplicationController
def add_bag
    if current_admin
      @client = Client.find(params[:id])
      if !current_admin.business.business_bags.include?(params[:bag_id].to_i)
        @client.bag_id = params[:bag_id]
        @client.save
      else
        flash[:alert] = "Bag is already in use"
      end
    end
    redirect_to business_path
  end

  def edit_bag
    if current_admin
      @client = Client.find(params[:id])
    end
  end

  def update_bag
    if current_admin
      @client = Client.find(params[:id])
      @client.bag_id = params[:client][:bag_id]
      @client.save
    end
    redirect_to business_path
  end

end
