class OrderItem < ActiveRecord::Base
  attr_accessible :order, :product_id, :quantity
  belongs_to :order
  belongs_to :product
end
