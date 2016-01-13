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
    @query = Word.where(id: words)
  end

  private

    def records
      query = params[:word][:word]

      case params[:word][:language]
        when "1"
          records = Definition.where("explaination like ?", "%#{query}%")
        when "2"
          records = Word.where("spelling like ?", "%#{query}%")
      end
    end

    def words
      word_ids = []
      records.each do |record|
        word_ids << record.id
      end
    end
end
