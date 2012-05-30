class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :address
  has_many :order_items
  accepts_nested_attributes_for :address
  
  def self.build(cart, user, address)
    order = new(:user_id => user.id)
    cart.cart_items.each do |cart_item|
      order.order_items.build(:product_id => cart_item.product.id)
    end
    cart.purchased_at = Time.now
    if order.save && cart.save && order.update_address(address)
      return true
    else
      return false
    end
  end
  
  def update_address(address)
    update_attributes(:address_attributes => address)
  end
end
