class OrdersController < ApplicationController
	def new
		@order = Order.new
	end

	def show
		@order = Order.find(params[:id])
	end

	def create
		binding.pry
		if request.xhr?
			

			{stuff: 'something'}.to_json
		end
			
		@order = Order.create(client_id: current_client.id, business_id: 1, box_in: 5, status: "In Box", paid: false)
	end

	def update
		
		@order = Order.find(params[:id])
		@order.update_attributes() #missing params from select to update @order
	end
end