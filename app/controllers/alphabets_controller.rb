class AlphabetsController < ApplicationController

  def show
    @letter = Alphabet.find(params[:id])
    @words = Word.where(alphabet_id: @letter.id).paginate(page: params[:page], per_page: 40).order(created_at: 'ASC')
  end

end
