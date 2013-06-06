class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user


  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    if current_user
        true
    else
        store_location
        flash[:error] = "You are not authorised. Please Sign in"
        redirect_to signin_path
    end
  end

  def correct_user
    @user=User.find(params[:id])
    if @current_user.admin?
        true
    else
     if @user.id==@current_user.id
        true
     else
        flash[:error] = "You are not authorised to edit/delete other's account."
        redirect_to current_user
     end
    end
  end

  def redirect_back_or(default)
          redirect_to(session[:return_to] || default)
          session.delete(:return_to)
      end

  def store_location
          session[:return_to] = request.url
  end

  def signed_in?
    if !current_user
    else
        flash[:error] = "Please Sign out."
        redirect_to current_user
    end
  end

end
