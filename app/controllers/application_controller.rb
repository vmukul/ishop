class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  before_filter :set_iphone_format
  helper_method :is_iphone_request?

  def is_iphone_request?
      request.user_agent =~ /(Mobile\/.+Safari)/
    end
  

  def set_iphone_format
      if is_iphone_request?
        request.format = :iphone
      end
    end
 

   def set_iphone_format
      if is_iphone_request? or request.format.to_sym == :iphone
        request.format = if cookies["browser"] == "desktop"
                         then :html
                         else :iphone
                         end
      end
    end

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
