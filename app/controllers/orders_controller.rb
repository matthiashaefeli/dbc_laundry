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
			b = Box.find_by(address: location)
		elsif params[:orders][:pick_up_address]
			location = params[:orders][:pick_up_address]
			b = Box.find_by(address: location)
		end

		@order = Order.create(client_id: current_client.id, business_id: 1, box_in: b.id , status: "In Box", paid: false)
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
				current_shipper.update_attributes(box_id: params[:order][:box_id])
				current_shipper.save
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

	def update_status
		if request.xhr?
			status = params[:order][:order_status]
			case status
			when 'In Box'
				orders = Order.where(status: 'In Box')
			when 'Incomming'
				orders = Order.where(status: 'Incomming')
			when 'Processing'
				orders = Order.where(status: 'Processing')
			when 'Shipping'
				orders = Order.where(status: 'Shipping')
			when 'Delivered'
				orders = Order.where(status: 'Delivered')
			else
				orders = Order.all
			end
			@orders = orders
			respond_to do |format|
				format.html { render partial:'businesses/orders', layout:false }
			end
		else
			@orders = Order.all
		end
	end

	def history
	end
end

