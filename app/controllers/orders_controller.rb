class OrdersController < ApplicationController
	def new
		@order = Order.new #Need to pass params of order details
	end

	def show
		@order = Order.find(params[:id]) #Show an order
	end

	def index 
		if params[:client_id]
		@orders = Order.where(client_id = ?, current_user.id) #Show all user orders, needs devise to work
		elsif params [:business_id]
		@orders = Order.where(business_id = ?, params[:business_id]) #show all orders belonging to a business
		end
	end
end
