class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_or_create_by!(
      provider: auth[:provider],
      uid: auth[:uid]
    )
    session[:user_id] = user.id

    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
