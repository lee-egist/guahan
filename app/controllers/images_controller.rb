class ImagesController < ApplicationController


  def new
    @myword = word
  end

  def create
    user = User.first
    image_path = params[:image][:image]
    image = Image.create(user_id: user.id, word_id: word.id, image_url: image_path)

    if image.save
    word.images << image
    redirect_to word_path(word)
    end

  end

end
