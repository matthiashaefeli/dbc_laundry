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
		
			# png =  Base64.decode64(params[:data]['data:image/png;base64,'.length .. -1])

		# File.open('pic.png', 'w+b') { |f| f.write(png) }

		#  #need to take out this expression (data:image\/jpeg;base64)
		
		# code = Qrio::Qr.load("pic.png").qr.text
		# if code == '@'
		# 	code = 1
		# end

		
		# code = ''
		 alt_id = params[:box_id]
		
		
		# end
		
		@order = Order.create(client_id: current_client.id, business_id: 1, box_in: alt_id, status: "In Box", paid: false)
	end

	def update
		
		@order = Order.find(params[:id])
		@order.update_attributes() #missing params from select to update @order
	end
end