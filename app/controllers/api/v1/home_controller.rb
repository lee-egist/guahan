class Api::V1::HomeController < ApplicationController

  def index
    words = Word.all
    @words = words.sample(10)
    render json: @words
  end
end
