class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, with: :null_session

  def current_user
    @current_user ||= User.find(session[:current_user_id]) if session[:current_user_id]
  end

  helper_method :current_user

  def authorize
    redirect_to login_path unless current_user
  end  
end
