class Admin::OrdersController < Admin::BaseController
  
  def index
    @orders = Order.all
  end
  
  def show
    @order = Order.find(params[:id])
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to admin_orders_url, :notice => "Successfully destroyed order."
  end
end