class OrdersController < ApplicationController



	def new
		@order = Order.new
	end

	def show
		@order = Order.find(params[:id])
	end

	def create
		if params[:box_and_location]
			set = params[:box_and_location].split('-')
			location = set[0]
			box_in = set[1]
		elsif params[:orders][:pick_up_address]
			location = [:orders][:pick_up_address]
			box_in = params[:orders][:box_id]
		end

		@order = Order.create(client_id: current_client.id, business_id: 1, box_in: box_in.to_i, status: "In Box", paid: false)
		redirect_to new_charge_path
	end

	def update
		@order = Order.find(params[:id])
		if params[:commit] == "Add order to History"
			@order.history = true
			@order.save
		elsif params[:order][:order_status] == nil
			if params[:order][:delivered_address] == ""
				redirect_to root_path and return
			else
				@box = Box.find_by(address: params[:order][:delivered_address])
				@order.update_attributes(:status => "Delivered", :box_out => @box.id)
				@order.save
				UserNotifier.send_update_email(@order.client).deliver
			end
		else
			if shipper = Shipper.find_by(name: params[:order][:assign_shipper_to_order])
				@order.update_attributes(status: params[:order][:order_status], shipper_id: shipper.id)
				@order.save
			else 
				@order.update_attributes(status: params[:order][:order_status])
				@order.save
			end
		end
		redirect_to root_path
	end

	def shippers
		render "shippers.html.erb"
	end

	def history
	end
end

