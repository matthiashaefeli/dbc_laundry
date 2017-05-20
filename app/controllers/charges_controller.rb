class ChargesController < ApplicationController

  def new
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
      :currency => 'usd'
      )
    @order = current_client.orders.last
    @order.paid = true
  rescue Stripe::CardError => e
    @order.paid = false
    flash[:error] = e.message
    redirect_to new_order_path
  end

  redirect_to root_path
end
