class AdminController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :validate_session, :search_setup

  def search_setup
    @languages = Language.all
    @alphabet = Alphabet.all
  end

  def word
    Word.find(params[:word_id])
  end

  def validate_session

    if !session[:user_id]
      redirect_to admin_login_path
    end

  end

  def current_user
    user = User.find(params[:user_id])
  end
end
