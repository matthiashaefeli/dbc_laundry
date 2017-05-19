class OrdersController < ApplicationController
 
skip_before_action :verify_authenticity_token

	def new
		@order = Order.new
	end

	def show
		@order = Order.find(params[:id])
	end

	def create
		png =  Base64.decode64(params[:data]['data:image/png;base64,'.length .. -1])

		File.open('pic.png', 'w+b') { |f| f.write(png) }

		code = Qrio::Qr.load("pic.png").qr.text
		if code == '@'
			code = 1
		end
		@order = Order.create(client_id: current_client.id, business_id: 1, box_in: code, status: "In Box", paid: false)
	end

	def update
		@order = Order.find(params[:id])
		if params[:order][:order_status] == nil
			if params[:order][:box_id] == ""
				redirect_to root_path and return
			else
				@order.update_attributes(status: "Delivered", box_out: params[:order][:box_id])
				@order.save
				current_shipper.update_attributes(box_id: params[:order][:box_id])
				current_shipper.save
				# UserNotifier.send_update_email(@order.client).deliver
			end
		else
			@order.update_attributes(status: params[:order][:order_status])
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

