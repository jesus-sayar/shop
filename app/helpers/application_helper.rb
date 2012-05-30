module ApplicationHelper
def messages_about_actions
  messages = ""
  flash.each do |key, message|
    css_class = generate_css_class(key.to_s)
    messages << content_tag(:div, (message + link_to_close).html_safe, :class => css_class)
  end
  messages.html_safe
end

def generate_css_class(key)
  css_class = 'alert-box'
  if key == 'notice'
    css_class << ' success'
  elsif key == 'alert'
    css_class << ' error'
  else
    css_class << " #{key}"
  end
  css_class
  end

  def link_to_close
   content_tag(:a, "\&times;".html_safe, :class => 'close').html_safe
  end
end
