class OrdersController < ApplicationController
	def new
		@order = Order.new #Need to pass params of order details
	end

	
end
