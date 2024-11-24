class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  allow_browser versions: :modern

  helper_method :current_user

  layout -> { ApplicationLayout }

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
