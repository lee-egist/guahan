class PronunciationsController < ApplicationController

  def new
    @myword = word
    @pronunciation = Pronunciation.new
  end

  def create

    phonetic = "/" + params[:pronunciation][:phonetic] + "/"
    wordId = params[:word_id]
    # params = {
    # "pronunciation"=> {"phonetic"=>"a:-mǝƱt-u:lǝƱ"},
    # "word_id"=>"558"}
    pronunciation = Pronunciation.find_by(word_id: wordId)
    pronunciation.update(phonetic: phonetic)

    if pronunciation.save
    # word.pronunciation << definition
    redirect_to word_path(word)
    end



  end
end
