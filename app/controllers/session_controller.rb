class SessionController < ApplicationController
  # logging in
  def new
  end

  # handle the post from the login page
  def create
    self.current_user = User.from_omniauth(request.env['omniauth.auth'])

    if current_user
      redirect_to auctions_path
    else
      redirect_to auth_path(provider: 'facebook')
    end
  end

  # logout
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  # Show the failure page
  def failure
    flash[:notice] = "Login Failure to Bidtastic"

    redirect_to root_path
  end
end
