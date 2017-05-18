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

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_order_path
  end
end
