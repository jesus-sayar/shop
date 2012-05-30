# encoding: UTF-8
class CartItemsController < ApplicationController
  include CartsHelper
  def create
    @product = Product.find(params[:product_id])
    unless product_in_cart(@product)
      @cart_item = CartItem.create!(:cart => current_cart, :product => @product, :quantity => 1)
      flash[:notice] = "Añadido #{@product.name} al carro."
    end
    redirect_to current_cart_url
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to current_cart_url
  end
end