class WordsController < ApplicationController

  before_action :verify_user_session, except: [:show]
  def show
    @myword = Word.find(params[:id])
    @definitions = @myword.definitions.where(verified: 1).order(created_at: :asc)
    @origins = @myword.origins
  end

  def new
    p "Session is:"
    puts "#{session[:user_id]}"
  end

  private

  def verify_user_session
    #code
    puts "Session is: #{session[:user_id]}"

    user = params[:user_id]
    # session = session[:user_id]

    unless user.to_i == session[:user_id]
      redirect_to user_login_path
    end
  end
end
