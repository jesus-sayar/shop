class HomePagesController < ApplicationController
  def welcome
    @products = Product.all
  end
end
