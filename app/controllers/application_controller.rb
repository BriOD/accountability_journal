class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user


  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) unless session[:user_id] == nil
  end

  def logged_in?
    !!session[:user_id]
  end

  def authorize
    redirect_to '/login' unless current_user
  end
end
