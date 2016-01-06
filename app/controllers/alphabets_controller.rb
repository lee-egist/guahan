class AlphabetsController < ApplicationController
  def show
    # @users = User.paginate(:page => params[:page], :per_page => 5)

    @letter = Alphabet.find(params[:id])
    @words = Word.where(alphabet_id: params[:id]).paginate(:page => params[:page], :per_page => 40).order(created_at: 'ASC')

  end
end
