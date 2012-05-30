module SessionsHelper
  def redirect_back_or(default)
    url = session[:return_to] || default
    clear_return_to
    return url
  end

  def store_location
    session[:return_to] = request.fullpath
  end
  
  def remember_url
    store_location unless signed_in?
  end
  
  private
    def clear_return_to
      session.delete(:return_to)
    end
end