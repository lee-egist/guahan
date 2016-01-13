class SessionsController < ApplicationController
  def new
  end

  def create

    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to admin_home_path
    else
      render 'new'
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def user
    user = User.find_by_handle(params[:user][:handle])
  end
end
