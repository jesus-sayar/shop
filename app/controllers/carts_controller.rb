class CartsController < ApplicationController
  include CartsHelper
  def show
    @cart = current_cart
  end
end
