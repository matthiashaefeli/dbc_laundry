class OrdersController < ApplicationController
	def new
		@order = Order.new
	end

	def show
		@order = Order.find(params[:id])
	end

	def create
		@order = Order.create(client_id: current_client.id, business_id: 1, box_in: 5, status: "In Box", paid: false)
		render "./home.html.erb"
	end

	def update
		@order = Order.find(params[:id])
		if params[:order][:order_status] == nil
			if params[:order][:delivered_address] == ""
				redirect_to root_path and return
			else
				@box = Box.find_by(address: params[:order][:delivered_address])
				@order.update_attributes(:status => "Delivered", :box_out => @box.id, :shipper_id => current_shipper)
				@order.save
				# UserNotifier.send_update_email(@order.client).deliver
			end
		else
			# binding.pry
			@order.update_attribute(:status, params[:order][:order_status])
			@order.save
		end
		redirect_to root_path
	end

	def shippers
		render "shippers.html.erb"
	end

	def history
	end
end

