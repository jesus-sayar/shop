class Cart < ActiveRecord::Base
  has_many :cart_items
  
  def empty?
    return true if items_in_cart.zero?
    return false
  end
  
  def items_in_cart
    cart_items.count
  end
  
  def total_price
    price = 0
    cart_items.each do |cart_item|
      price += cart_item.product.price
    end
    price
  end
end
