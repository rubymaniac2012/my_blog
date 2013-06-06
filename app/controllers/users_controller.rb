class UsersController < ApplicationController

  before_filter :require_login, :only=>[:show ,:edit, :index, :update, :destroy]

  before_filter :correct_user, :only=>[:edit, :update, :destroy]

  before_filter :signed_in?, :only=>[:new, :create]

  def index
    @users=User.paginate(page: params[:page])
  end

  def new
    @user=User.new
  end

  def create
    @user=User.new(params[:user])
    if @user.save
        flash[:success] = "Welcome to My Blog"
        redirect_to user_path(@user)
    else
        render :new
    end
  end

  def show
    @user=User.find(params[:id])
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    if @user.update_attributes(params[:user])
        flash.now[:success] = "User updated"
        redirect_to @user
    else
        render :edit
    end
  end

  def destroy
    @user=User.find(params[:id])
    @user.destroy
    flash[:success] = "Successfully deleted the account"
    redirect_to users_path
  end

end
