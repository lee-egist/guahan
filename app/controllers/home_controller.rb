class HomeController < ApplicationController
  def index
    @words = Word.all.sample(10)
  end

  def legal
  end
end
