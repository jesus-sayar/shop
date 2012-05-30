class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery
  rescue_from AccessDenied, :with => :access_denied
 
  def after_sign_in_path_for(resource)
    redirect_back_or root_url
  end
  
  protected
    def access_denied
      redirect_to "/401.html"
    end
    
end
