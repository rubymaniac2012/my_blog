class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by_email(params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
           session[:user_id] = user.id
           redirect_back_or user
        else
            flash.now[:error] = "Invalid username or password"
            render 'new'
        end
  end

    def destroy
        session[:user_id]=nil
        flash[:success] = "Successfully logged out."
        redirect_to root_url
    end

end
