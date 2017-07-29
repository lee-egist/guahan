class HomeController < ApplicationController
  def index
    puts "Session is: #{session[:user_id]}"
    @words = Word.all.sample(10)

    if params[:user_id]
      @user = params[:user_id]
    else
      @user = User.new
    end
  end

  def legal
  end
end
