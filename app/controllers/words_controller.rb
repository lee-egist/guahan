class WordsController < ApplicationController
  def index
  end

  def show
    @myword = Word.find(params[:id])
    @definitions = @myword.definitions.order(created_at: :asc)
    @origins = @myword.origins
    @comments = @myword.comments
    @pronounciations = @myword.pronounciations
    @examples  = @myword.examples
    @images = @myword.images
    @page = params[:page]
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def search
    p params
    word_ids = []
    case params[:word][:language]
    when "1"
      p "language is english"
      query = params[:word][:word]
      test = Definition.where("explaination like ?", "%#{query}%")
      test.each do |result|
        word_ids << result.word_id
      end
    when "2"
      p "language is chammorru"
      query = params[:word][:word]
      test = Word.where("spelling like ?", "%#{query}%")
      test.each do |record|
        word_ids << record.id
      end
    end
    @query = Word.where(id: word_ids)
    # @words = Word.where(alphabet_id: params[:id]).paginate(:page => params[:page], :per_page => 40).order(created_at: 'ASC')
  end

  def destroy
  end
end
