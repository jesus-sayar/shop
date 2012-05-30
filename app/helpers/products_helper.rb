module ProductsHelper
  def create_products_grid(products, &block)
    html = ""
    products.each_with_index do |product, index|
      html <<	"<div class=\"row\">" if (index % 3 == 0) || index == 0
    	  
    	content = capture(product, &block)
    	html << content_tag(:div, content, :class => 'four columns')
      
      html <<	"</div>" if (index+1) % 3 == 0 || (index+1 == products.size)
    end
	  html.html_safe
  end
end
