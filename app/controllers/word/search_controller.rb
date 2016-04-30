class Word::SearchController < ApplicationController

  def create
    search = params[:search][:search_word]
    query = Word.where(id: words).paginate(page: params[:page], per_page: 40).order(created_at: 'ASC')

    if query
      render partial: 'show', locals: { results: query }
    else
      redirect_to root_path
    end
  end

  private

    def words
      word_ids = []
      records.each do |record|
        word_ids << record.id
      end
    end

    def records
      query = params[:search][:search_word]

      case params[:search][:language]
        when "1"
          records = Definition.where("explanation like ?", "%#{query}%")
        when "2"
          records = Word.where("spelling like ?", "%#{query}%")
      end
    end
end
