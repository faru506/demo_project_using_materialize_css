class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :require_user

  helper_method :cuurent_user, :logged_in?
  def current_user
    @current_user ||= Cricketer.find(session[:cricketer_id]) if session[:cricketer_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:notice] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end
end
