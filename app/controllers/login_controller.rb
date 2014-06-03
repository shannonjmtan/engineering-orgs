class LoginController < ApplicationController

  def login; end

  # "Create" a login, aka "log the user in"
  def create
    if user = User.authenticate(params[:login][:username], params[:login][:password])
      # Save the user ID in the session so it can be used in
      # subsequent requests
      session[:current_user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash[:login] = "Did you forget your password or username?"
      render action: "login"
    end
  end

  # "Delete" a login, aka "log the user out"
  def destroy
    # Remove the user id from the session
    session[:current_user_id] = nil
    @_current_user = nil
    redirect_to root_url
  end

end
