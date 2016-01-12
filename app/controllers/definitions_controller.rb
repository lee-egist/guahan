class DefinitionsController < ApplicationController

  def new
    @myword = word
    @definition = Definition.new
  end

  def create

    user = User.first
    explanation = params[:definition][:explanation]
    definition = Definition.create(user_id: user.id, word_id: word.id, explanation: explanation)

    if definition.save
    word.definitions << definition
    redirect_to word_path(word)
    end

  end


  private

end
