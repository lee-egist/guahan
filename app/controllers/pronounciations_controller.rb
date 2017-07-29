class PronounciationsController < ApplicationController

  def new
    @myword = word
    @pronounciation = Pronounciation.new
  end

  def create

    phonetic = "/" + params[:pronounciation][:phonetic] + "/"
    wordId = params[:word_id]
    # params = {
    # "pronounciation"=> {"phonetic"=>"a:-mǝƱt-u:lǝƱ"},
    # "word_id"=>"558"}
    pronunciation = Pronounciation.find_by(word_id: wordId)
    pronunciation.update(phonetic: phonetic)

    if pronunciation.save
    # word.pronounciation << definition
    redirect_to word_path(word)
    end



  end
end
