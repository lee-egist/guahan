class WordsController < ApplicationController


  def show
    @myword = Word.find(params[:id])
    @definitions = @myword.definitions.order(created_at: :asc)
    @origins = @myword.origins
  end

  private

end
