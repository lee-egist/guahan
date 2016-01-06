class HomeController < ApplicationController
  def index
    p params
    words = Word.all
    @words = words.sample(10)
  end
end
