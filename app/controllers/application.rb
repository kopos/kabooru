# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem

  #helper :all # include all helpers, all the time
  session :session_key => '_kabooru_session_id'

  before_filter :login_from_cookie #for 'remember me' functionality
  #before_filter :login_required, :except => [:login, :about]

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '061c59dbb82a35ee8ca203c94566062c'
end
