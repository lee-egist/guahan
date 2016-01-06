class DefinitionsController < ApplicationController
  def show
  end

  def new
    @myword = Word.find(params[:word_id])
    @definition = Definition.new
  end

  def create
    # p params
    user = User.first
    word = Word.find(params[:word_id])
    newdef = Definition.create(user_id: user.id, word_id: word.id, explaination: params[:definition][:explaination])
    p newdef
    if newdef.save
    word.definitions << newdef
    redirect_to word_path(word)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
