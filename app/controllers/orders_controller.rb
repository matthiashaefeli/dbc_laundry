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
		@order.update_attributes(status: params[:order][:area])
		@order.save
		UserNotifier.send_test_email
		redirect_to root_path
	end
end
