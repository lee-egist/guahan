class Definition < ActiveRecord::Base

  belongs_to :word
  belongs_to :user

  validates :word, presence: true
  validates :explanation, presence: true
  validates :user, presence: true
end
