class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    redirect_to login_path unless logged_in?
  end

  def require_merchant
    if !logged_in? || current_user.role != 'merchant'
      flash.alert = 'You do not have permissions to access this feature!'
      redirect_to root_path
    end
  end

  def require_customer
    if !logged_in? || current_user.role != 'customer'
      flash.alert = 'You do not have permissions to access this feature!'
      redirect_to root_path
    end
  end
end
