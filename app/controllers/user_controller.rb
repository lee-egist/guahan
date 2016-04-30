class UserController < ApplicationController

  def new

    @user = User.new

  end

  def create

    user = User.new(user_params)

    if user.save
      redirect_to user
    else
      flash[:notice] = "User was not created"
      render 'new'
    end
  end

  def edit

    @user = User.find(params[:id])

  end

  def update

    user = User.find(params[:id])

    if user
      user.update(user_params)
      if user.save
        redirect_to user
      else
        flash[:notice] = "unable to edit user info"
        render 'edit'
      end
    else
      flash[:notice] = "no user found"
      render 'edit'
    end
  end

  def destroy

    user = User.find(params[:id])
    user.destroy

  end

  private

    def user_params
      params.require(:user).permit(:handle, :email, :password)
    end
end
