class SessionController < ApplicationController
  # say something nice, you goof!  something sweet.
  def index
    #redirect_to(:action => 'signup') unless logged_in? || User.count > 0
    redirect_to(:action => 'login') unless logged_in? || User.count > 0
  end
  
  def about
  end

  def login
    return unless request.post?
    self.current_user = User.authenticate(params[:login], params[:password])
    if logged_in?
      if params[:remember_me] == "1"
        self.current_user.remember_me
        cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
      end
      redirect_back_or_default(:controller => '/dashboard', :action => 'index')
      flash[:notice] = "Welcome #{self.current_user.name}!"
    else
      flash.now[:error] = "Authentication failure"
    end
  end

  def signup
    @user = User.new(params[:user])
    return unless request.post?
    @user.save!
    self.current_user = @user
    redirect_back_or_default(:controller => '/session', :action => 'index')
    flash[:notice] = "Thanks for signing up!"
  rescue ActiveRecord::RecordInvalid
    render :action => 'signup'
  end
  
  def logout
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_back_or_default('/')
  end
end
