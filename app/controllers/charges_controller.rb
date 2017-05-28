class ChargesController < ApplicationController

  def new
    #params are used for late payments
    
    if params[:order_id]
      @order = Order.find(params[:order_id])
      session[:order_id] = @order.id
    end
  end

  def create
    #amount in cents
    @amount = 1500

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source => params[:stripeToken]
      )

    charge = Stripe::Charge.create(
      :customer => customer.id,
      :amount => @amount,
      :description => "Bag of clothes",
      :statement_descriptor => "Dbc Laundry",
      :currency => 'usd'
      )

    #sessions is used for late payments
    if session[:order_id]
      @order = Order.find(session[:order_id])
      session[:order_id] = nil
    else
      @order = current_client.orders.last
    end
    @order.paid = true
    @order.total = @amount/100
    @order.save

  rescue Stripe::CardError => e
    @order.paid = false
    flash[:error] = e.message
    redirect_to new_order_path

  end


end
