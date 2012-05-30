class OrdersController < ApplicationController
  include CartsHelper
  before_filter :authenticate_user!
  
  def checkout
    setup_response = gateway.setup_purchase(to_cents(current_cart.total_price),
      :ip                => request.remote_ip,
      :return_url        => confirm_url,
      :cancel_return_url => current_cart_url,
      :currency => "EUR",
      :items => items_of_current_cart
    )
    redirect_to gateway.redirect_url_for(setup_response.token)
  end

  def confirm
    redirect_to current_cart_url unless params[:token]
    
    details_response = gateway.details_for(params[:token])

    if !details_response.success?
      @message = details_response.message
      render :action => 'error'
      return
    end
    @address = details_response.address
    @cart = current_cart
   end

   def complete
     purchase = gateway.purchase(to_cents(current_cart.total_price),
      :ip       => request.remote_ip,
      :currency => "EUR",
      :payer_id => params[:payer_id],
      :token    => params[:token]
     )
     if !purchase.success?
       @message = purchase.message
       render :action => 'error'
     end
     Order.build(current_cart, current_user, params[:address])
   end

   private
    def items_of_current_cart
      items = Array.new
      current_cart.cart_items.each do |cart_item|
        items.push({ 
          :name => cart_item.product.name,
          :number => cart_item.product.id,
          :quantity => cart_item.quantity, 
          :amount => to_cents(cart_item.product.price),
        })
      end
      items
    end

    def gateway
      @gateway ||= ActiveMerchant::Billing::PaypalExpressGateway.new(
       :login => "seller_1338408875_biz_api1.gmail.com",
       :password => "1338408902",
       :signature => "AFcWxV21C7fd0v3bYYYRCpSSRl31ABJr.qC.AS7nZAM54DsmqpLv.kNX"
     )
     end

     def to_cents(money)
      (money*100).round
     end
end