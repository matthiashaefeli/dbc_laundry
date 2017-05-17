class OrdersController < ApplicationController
	def new
		@order = Order.new #Need to pass params of order details
	end

	def show
		@order = Order.find(params[:id]) #Show an order
	end

	def index 
		@orders = Order.where(client_id = ?, current_user.id) #Show all user orders, needs devise to work
	end
end
