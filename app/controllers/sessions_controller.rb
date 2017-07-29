class SessionsController < ApplicationController
  def new
    @session = User.new
  end

  def create

    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to root_path(user_id: user.id)
    else
      flash.now[:notice] = "Unable to log in user"
      @session = User.new
      render 'new'
    end
  end

  def destroy
    if session[:user_id]
      session[:user_id] = nil
      redirect_to root_path
    end
  end

  def user
    user = User.find_by_handle(params[:user][:handle])
  end
end
