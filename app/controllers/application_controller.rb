class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :search_setup

  def search_setup
    @languages = Language.all
    @alphabet = Alphabet.all
  end

  def word
    Word.find(params[:word_id])
  end
end
