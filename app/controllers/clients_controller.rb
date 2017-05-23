class ClientsController < ApplicationController
def add_bag
    if current_admin && !helpers.bag_in_use(params[:bag_id]) 
      @client = Client.find(params[:id])
      @client.bag_id = params[:bag_id]
      @client.save
    else
        flash[:alert] = "Bag is already in use"
    end
    redirect_to business_path
  end

  def edit_bag
    if current_admin
      @client = Client.find(params[:id])
    end
  end

  def update_bag
    if current_admin && !helpers.bag_in_use(params[:client][:bag_id])
      @client = Client.find(params[:id])
      @client.bag_id = params[:client][:bag_id]
      @client.save
      redirect_to business_path
    else
      flash[:alert] = "Bag is already in use"
      redirect_to edit_bag_path
    end
  end

end
