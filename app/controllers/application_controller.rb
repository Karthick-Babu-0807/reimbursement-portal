class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def authorized_admin!
    if !logged_in?
      redirect_to login_path, alert: "Please sign in first."
    elsif !current_user.admin?
      redirect_to bills_path, alert: "Access denied: Admins only."
    end
  end

  def redirect_if_logged_in
    if logged_in?
      path = current_user.admin? ? employees_path : bills_path
      redirect_to path
    end
  end
end
