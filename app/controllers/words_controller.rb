class WordsController < ApplicationController


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

  def search
    @search_word = params[:word][:search_word]
    @query = Word.where(id: words).paginate(page: params[:page], per_page: 40).order(created_at: 'ASC')
  end

  private

    def words
      word_ids = []
      records.each do |record|
        word_ids << record.id
      end
    end

    def records
      query = params[:word][:search_word]

      case params[:word][:language]
        when "1"
          records = Definition.where("explanation like ?", "%#{query}%")
        when "2"
          records = Word.where("spelling like ?", "%#{query}%")
      end
    end

end
