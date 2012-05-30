module CartsHelper
  def current_cart
    if session[:cart_id]
      begin
        @current_cart ||= Cart.find(session[:cart_id])
        session[:cart_id] = nil if @current_cart.purchased_at
      rescue Exception => e
        session[:cart_id] = nil 
      end
    end
    if session[:cart_id].nil?
      @current_cart = Cart.create!
      session[:cart_id] = @current_cart.id
    end
    @current_cart
  end
  
  def product_in_cart(product)
    current_cart.cart_items.each do |cart_item|
      return true if cart_item.product_id == product.id
    end
    false
  end
  
  def link_to_cart
    link_text = "Carro" + " de Compra " + "(#{current_cart.items_in_cart})"
    link_to( link_text, current_cart_url)
  end
end
