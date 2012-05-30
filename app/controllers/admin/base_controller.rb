class Admin::BaseController < ApplicationController
  before_filter :remember_url
  before_filter :authenticate_user!
  before_filter :deny_access_to_unauthorized_users
  layout 'admin'
  
  def deny_access_to_unauthorized_users
    raise AccessDenied unless current_user.admin?
  end
end