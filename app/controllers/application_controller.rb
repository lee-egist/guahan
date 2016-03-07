class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :search_setup, :set_locale

  def search_setup
    @languages = Language.all
    @alphabet = Alphabet.all
  end

  def set_locale
    #code
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    {locale: I18n.locale }.merge options
  end

  def word
    Word.find(params[:word_id])
  end
end
