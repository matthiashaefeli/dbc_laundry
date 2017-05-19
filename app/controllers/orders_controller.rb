class OrdersController < ApplicationController
 
skip_before_action :verify_authenticity_token

	def new
		@order = Order.new
	end

	def show
		@order = Order.find(params[:id])
	end

	def create
		 
		# if request.xhr?
		
		something =  Qrio::Qr.load("public/static_qr_code_without_logo2.png").qr.text
		if something == '@'
			something = 1
		end

		
		# end
		binding.pry	
		@order = Order.create(client_id: current_client.id, business_id: 1, box_in: something, status: "In Box", paid: false)
	end

	def update
		
		@order = Order.find(params[:id])
		@order.update_attributes() #missing params from select to update @order
	end
end