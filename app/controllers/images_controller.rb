class ImagesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @myword = Word.find(params[:word_id])
  end

  def create
    p params
    user = User.first
    word = Word.find(params[:word_id])
    image = Image.create(user_id: user.id, word_id: word.id, image: params[:image][:image])
    if image.save
    word.images << image
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
