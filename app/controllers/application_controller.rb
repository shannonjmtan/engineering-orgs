class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    # Note: we want to use "find_by_id" because it's OK to return a nil.
    # If we were to use User.find, it would throw an exception if the user can't be found.
    @_current_user ||= User.find_by_id(session[:current_user_id]) if session[:current_user_id]
  end

  private
    def set_current_user
      @user = current_user
      redirect_to login_path if @user.nil?
    end

    def check_super_user
      if current_user == nil
        redirect_to root_path
      else if !current_user.site_admin
        redirect_to root_path
      end
      end
    end
end
