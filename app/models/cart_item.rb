class CartItem < ActiveRecord::Base
  attr_accessible :cart, :product, :quantity
  belongs_to :cart
  belongs_to :product
end
