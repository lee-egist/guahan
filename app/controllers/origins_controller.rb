class OriginsController < ApplicationController


  def new
    @myword = Word.find(params[:word_id])
  end

  def create
    user = User.all.first
    word = Word.find(params[:word_id])
    story = params[:origin][:story]

    new_origin = Origin.create(user: user, word: word, story: story)

    if new_origin.save
      redirect_to word
    else
      render 'new'
    end
  end

end
