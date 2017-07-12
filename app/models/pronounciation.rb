class Pronounciation < ActiveRecord::Base

  belongs_to :word

  # validates :word, presence: true
  # validates :phonetic, presence: true
end
